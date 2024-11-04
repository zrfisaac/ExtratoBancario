unit uUnitConfig;

interface

uses
  System.SysUtils,
  System.IniFiles,
  System.Win.Registry,
  System.Classes,
  Winapi.Windows;

type
  // Interface de configuracao
  IConfig = interface
    ['{EC2853C3-ADB5-461B-9571-0A9522A4ADD8}']
    function Gravar(ACaminho, AGrupo, ANome, AValor: string): string; overload;
    function Gravar(AGrupo, ANome, AValor: string): string; overload;
    function Gravar(ANome, AValor: string): string; overload;
    function Gravar(ANome: string): string; overload;
    function Ler(ACaminho, AGrupo, ANome, AValor: string): string; overload;
    function Ler(AGrupo, ANome, AValor: string): string; overload;
    function Ler(ANome, AValor: string): string; overload;
    function Ler(ANome: string): string; overload;
  end;

  // Classe Base de configuracao
  TConfigBase = class(TInterfacedObject, IConfig)
  private
    FCaminho: string;
    FGrupo: string;
  public
    property Caminho: string read FCaminho write FCaminho;
    property Grupo: string read FGrupo write FGrupo;
    function Gravar(ACaminho, AGrupo, ANome, AValor: string): string; overload; virtual;
    function Gravar(AGrupo, ANome, AValor: string): string; overload;
    function Gravar(ANome, AValor: string): string; overload;
    function Gravar(ANome: string): string; overload;
    function Ler(ACaminho, AGrupo, ANome, AValor: string): string; overload; virtual;
    function Ler(AGrupo, ANome, AValor: string): string; overload;
    function Ler(ANome, AValor: string): string; overload;
    function Ler(ANome: string): string; overload;
  end;

  // Classe de configuracao INI
  TConfigIni = class(TConfigBase)
  public
    function Gravar(ACaminho, AGrupo, ANome, AValor: string): string; overload; override;
    function Ler(ACaminho, AGrupo, ANome, AValor: string): string; overload; override;
  end;

  // Classe de configuracao Reg
  TConfigReg = class(TConfigBase)
  public
    function Gravar(ACaminho, AGrupo, ANome, AValor: string): string; overload; override;
    function Ler(ACaminho, AGrupo, ANome, AValor: string): string; overload; override;
  end;

// Obter configuracao padrao
function Config(AClass: TComponentClass = nil): TConfigBase;

implementation

var
  VConfig: TConfigBase;

function Config(AClass: TComponentClass = nil): TConfigBase;
var
  AResult: TConfigBase;
begin
  if (Assigned(AClass)) then
  begin
    AResult := TConfigBase(AClass.NewInstance);
    AResult.Create;
    VConfig := AResult;
  end
  else
  begin
    if not(Assigned(VConfig)) then
    begin
      VConfig := TConfigIni.Create;
      VConfig.FCaminho := GetCurrentDir + '\' + 'config.ini';
      VConfig.FGrupo := 'principal';
    end;
    AResult := VConfig
  end;
  Result := AResult;
end;

{ TConfigBase }

function TConfigBase.Gravar(ACaminho, AGrupo, ANome, AValor: string): string;
begin
  // Metodo Virtual
end;

function TConfigBase.Gravar(AGrupo, ANome, AValor: string): string;
begin
  Result := Self.Gravar(Self.FCaminho, AGrupo, ANome, AValor);
end;

function TConfigBase.Gravar(ANome, AValor: string): string;
begin
  Result := Self.Ler(Self.FCaminho, Self.FGrupo, ANome, AValor);
end;

function TConfigBase.Gravar(ANome: string): string;
begin
  Result := Self.Ler(Self.FCaminho, Self.FGrupo, ANome, '');
end;

function TConfigBase.Ler(ACaminho, AGrupo, ANome, AValor: string): string;
begin
  // Metodo Virtual
end;

function TConfigBase.Ler(AGrupo, ANome, AValor: string): string;
begin
  Result := Self.Ler(Self.FCaminho, AGrupo, ANome, AValor);
end;

function TConfigBase.Ler(ANome, AValor: string): string;
begin
  Result := Self.Ler(Self.FCaminho, Self.FGrupo, ANome, AValor);
end;

function TConfigBase.Ler(ANome: string): string;
begin
  Result := Self.Ler(Self.FCaminho, Self.FGrupo, ANome, '');
end;

{ TConfigIni }

function TConfigIni.Gravar(ACaminho, AGrupo, ANome, AValor: string): string;
var
  AResult: string;
  AIniFile: TIniFile;
begin
  AResult := '';
  AIniFile := TIniFile.Create(ACaminho);
  try
    AIniFile.WriteString(AGrupo, ANome, AValor);
    AResult := AValor;
  finally
    AIniFile.Free;
  end;
  Result := AResult;
end;

function TConfigIni.Ler(ACaminho, AGrupo, ANome, AValor: string): string;
var
  AResult: string;
  AIniFile: TIniFile;
begin
  AResult := '';
  AIniFile := TIniFile.Create(ACaminho);
  try
    AResult := AIniFile.ReadString(AGrupo, ANome, AValor);
    AIniFile.WriteString(AGrupo, ANome, AResult);
  finally
    AIniFile.Free;
  end;
  Result := AResult;
end;

{ TConfigReg }

function TConfigReg.Gravar(ACaminho, AGrupo, ANome, AValor: string): string;
var
  AResult: string;
  ARegistry: TRegistry;
begin
  AResult := '';
  ARegistry := TRegistry.Create(KEY_ALL_ACCESS);
  try
    if (ACaminho = 'HKEY_CLASSES_ROOT') then
      ARegistry.RootKey := HKEY_CLASSES_ROOT
    else if (ACaminho = 'HKEY_CURRENT_USER') then
      ARegistry.RootKey := HKEY_CURRENT_USER
    else if (ACaminho = 'HKEY_LOCAL_MACHINE') then
      ARegistry.RootKey := HKEY_LOCAL_MACHINE
    else if (ACaminho = 'HKEY_USERS') then
      ARegistry.RootKey := HKEY_USERS
    else
      ARegistry.RootKey := HKEY_CURRENT_USER;
    if ARegistry.OpenKey(AGrupo, True) then
    begin
      ARegistry.WriteString(ANome, AValor);
      AResult := ARegistry.ReadString(ANome);
      ARegistry.CloseKey;
    end;
  finally
    ARegistry.Free;
  end;
  Result := AResult;
end;

function TConfigReg.Ler(ACaminho, AGrupo, ANome, AValor: string): string;
var
  AResult: string;
  ARegistry: TRegistry;
begin
  AResult := '';
  ARegistry := TRegistry.Create(KEY_ALL_ACCESS);
  try
    if (ACaminho = 'HKEY_CLASSES_ROOT') then
      ARegistry.RootKey := HKEY_CLASSES_ROOT
    else if (ACaminho = 'HKEY_CURRENT_USER') then
      ARegistry.RootKey := HKEY_CURRENT_USER
    else if (ACaminho = 'HKEY_LOCAL_MACHINE') then
      ARegistry.RootKey := HKEY_LOCAL_MACHINE
    else if (ACaminho = 'HKEY_USERS') then
      ARegistry.RootKey := HKEY_USERS
    else
      ARegistry.RootKey := HKEY_CURRENT_USER;
    if ARegistry.OpenKey(AGrupo, True) then
    begin
      AResult := ARegistry.ReadString(ANome);
      if (AResult = '') then
        AResult := AValor;
      ARegistry.WriteString(ANome, AResult);
      ARegistry.CloseKey;
    end;
  finally
    ARegistry.Free;
  end;
  Result := AResult;
end;

end.

