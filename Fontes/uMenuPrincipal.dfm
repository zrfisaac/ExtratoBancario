object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'frmMenuPrincipal'
  ClientHeight = 361
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = miMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 342
    Width = 584
    Height = 19
    Panels = <>
  end
  object miMenu: TMainMenu
    Left = 16
    Top = 16
    object miConfig: TMenuItem
      Caption = 'Configura'#231#227'o'
    end
    object miSobre: TMenuItem
      Caption = 'Sobre'
    end
  end
end
