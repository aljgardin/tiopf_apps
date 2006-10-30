unit tiCGIExtensionRequestDBProxyServer;

interface
uses
  tiCGIExtensionRequest
  ;

const
  cErrorTIOPFErrorCode = 'Error executing command on application server: "%s"' + #13#10 + 'Message: "%s"';
  cErrorExecutingHTTPPost = 'Error calling %s' + #13#10 + 'Message: %s' + #13#10 + 'Response: %s';

type

  {: Concrete TtiCGIExtensionRequest for shelling out to a CGI Extension.
     Makes calls to the CGI.exe via a tiDBProxyServer - used for deployed apps.}
  TtiCGIExtensionRequestDBProxyServer = class(TtiCGIExtensionRequest)
  public
    function Execute(const AULR : string;
                     const ACGIExeName: string ;
                     const AParams : string;
                     const AConnectWith: string;
                     const AProxyServerActive: Boolean;
                     const AProxyServerName: string;
                     const AProxyServerPort: integer ): string; override;
  end ;

implementation
uses
   tiHTTP
  ,tiHTTPMSXML // Remove this when the FlushParams problem is fixed.
  ,tiExcept
  ,SysUtils
  ,tiQueryRemote
  ,tiConstants
  ,tiLog
  ;

{ TtiCGIExtensionRequestDBProxyServer }

function TtiCGIExtensionRequestDBProxyServer.Execute(
  const AULR : string;
  const ACGIExeName: string ;
  const AParams : string;
  const AConnectWith: string;
  const AProxyServerActive: Boolean;
  const AProxyServerName: string;
  const AProxyServerPort: integer): string;
var
  LHTTP: TtiHTTPAbs;
  LURL: string;
  LErrorCode: Byte;
begin
  Assert(AULR<>'', 'pURL not assigned');
  Assert(ACGIExeName<>'', 'pCGIExeName not assigned');
  Assert(AConnectWith<>'', 'pConnectWith not assigned');

  LURL:= AULR + '/' + ACGIExeName;
  LErrorCode:=0;
  LHTTP:= gTIHTTPFactory.CreateInstance(AConnectWith);
  try
    if AProxyServerActive then
    begin
      LHTTP.ProxyServer := AProxyServerName;
      LHTTP.ProxyPort := AProxyServerPort;
    end ;
    LHTTP.FormatExceptions := False ;
    LHTTP.Input.WriteString(AParams);
    try
      if LHTTP is TtiHTTPMSXML then
        (LHTTP as TtiHTTPMSXML).AutoFlushCache:= False;
      LHTTP.Post(LURL);
      LErrorCode:= LHTTP.ResponseTIOPFErrorCode;
      Result := Trim(LHTTP.Output.DataString);
    except
      on e:Exception do
        raise Exception.CreateFmt(cErrorExecutingHTTPPost,
          [LURL, e.message, LHTTP.ResponseText]);
    end;
  finally
    LHTTP.Free;
  end;
  if LErrorCode > 0 then
    raise EtiOPFDataException.CreateFmt(cErrorTIOPFErrorCode, [LURL, Result]);
end;

initialization
  Assert(gCGIExtensionRequestClass=nil, 'gCGIExtensionRequestClass already assigned');
  gCGIExtensionRequestClass:= TtiCGIExtensionRequestDBProxyServer;

end.
