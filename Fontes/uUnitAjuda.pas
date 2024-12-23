unit uUnitAjuda;

interface

uses
  System.SysUtils,
  Winapi.Windows;

function fnFloatToStr(const AValue: Extended; const AFormat: String = '0.###'): string;
function fnStrToDateTime(AValue: string): TDateTime;
procedure fnVersionInfo(var V1, V2, V3, V4: word);
function fnVersion: string;

implementation

procedure fnVersionInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;
end;

function fnVersion: string;
var
  V1, V2, V3, V4: word;
begin
  fnVersionInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' + IntToStr(V4);
end;

function fnFloatToStr(const AValue: Extended; const AFormat: String = '0.###'): string;
var
  ASettings: TFormatSettings;
begin
  GetLocaleFormatSettings(GetThreadLocale, ASettings);
  ASettings.DecimalSeparator := '.';
  Result := FormatFloat(AFormat, AValue, ASettings);
end;

function fnStrToDateTime(AValue: string): TDateTime;
var
  ASettings: TFormatSettings;
begin
  ASettings := TFormatSettings.Create;
  ASettings.DateSeparator := '-';
  ASettings.ShortDateFormat := 'yyyy-MM-dd';
  ASettings.TimeSeparator := ':';
  ASettings.ShortTimeFormat := 'hh:mm';
  ASettings.LongTimeFormat := 'hh:mm:ss';
  Result := StrToDateTime(AValue, ASettings);
end;

end.
