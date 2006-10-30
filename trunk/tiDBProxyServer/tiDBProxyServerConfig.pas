unit tiDBProxyServerConfig;

interface
uses
  tiWebServerConfig
  ;

const
  cINIDatabaseConnection = 'Database Connection';
  cINIDatabaseConnection_DatabaseName = 'DatabaseName';
  cINIDatabaseConnection_UserName     = 'UserName';
  cINIDatabaseConnection_Password     = 'Password';

  cINIApplicationServer = 'Application Server';

type

  TtiDBProxyServerConfig = class(TtiWebServerConfig)
  private
    function   GetDatabaseName: string;
    function   GetPassword: string;
    function   GetUserName: string;
    function   GetTransactionTimeout: Byte;
    function   GetTestRefreshRateSec: Byte;
  public
    property    DatabaseName: string Read GetDatabaseName;
    property    UserName: string     Read GetUserName;
    property    Password: string     Read GetPassword;
    property    TransactionTimeout: Byte Read GetTransactionTimeout;
    property    TestRefreshRateSec: Byte Read GetTestRefreshRateSec;
  end;

implementation
uses
  SysUtils
  ;

const
  cINIDatabaseConnection_TransactionTimeout = 'TransactionTimeout';

  cINIDatabaseConnection_DefaultDatabaseName = '..\Data\Data.gdb';
  cINIDatabaseConnection_DefaultPassword = 'masterkey';
  cINIDatabaseConnection_DefaultTransactionTimeout = 1;
  cINIDatabaseConnection_DefaultUserName = 'SYSDBA';

  cINIApplicationServer_TestRefreshRate = 'TestRefreshRateSec';
  cINIApplicationServer_DefaultTestRefreshRateSec = 1;



{ TtiDBProxyServerConfig }

function TtiDBProxyServerConfig.GetDatabaseName: string;
begin
  Result:= INI.ReadString(cINIDatabaseConnection, cINIDatabaseConnection_DatabaseName, ExpandFileName(cINIDatabaseConnection_DefaultDatabaseName));
end;

function TtiDBProxyServerConfig.GetPassword: string;
begin
  Result:= INI.ReadString(cINIDatabaseConnection, cINIDatabaseConnection_Password, cINIDatabaseConnection_DefaultPassword);
end;

function TtiDBProxyServerConfig.GetTestRefreshRateSec: Byte;
begin
  Result := INI.ReadInteger(cINIDatabaseConnection, cINIApplicationServer_TestRefreshRate, cINIApplicationServer_DefaultTestRefreshRateSec) ;
end;

function TtiDBProxyServerConfig.GetTransactionTimeout: Byte;
begin
  Result := INI.ReadInteger(cINIDatabaseConnection, cINIDatabaseConnection_TransactionTimeout, cINIDatabaseConnection_DefaultTransactionTimeout ) ;
end;

function TtiDBProxyServerConfig.GetUserName: string;
begin
  Result:= INI.ReadString(cINIDatabaseConnection, cINIDatabaseConnection_UserName, cINIDatabaseConnection_DefaultUserName);
end;

end.

