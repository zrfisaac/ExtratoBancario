unit uUnitAjuda;

interface

uses
  System.SysUtils;

function fnStrToDateTime(AValue: string): TDateTime;

implementation

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
