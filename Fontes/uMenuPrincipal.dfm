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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
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
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object miMenu: TMainMenu
    Left = 16
    Top = 16
    object miModelo: TMenuItem
      Action = acModelo
    end
    object miTransacao: TMenuItem
      Action = acTransacao
    end
    object miConfiguracao: TMenuItem
      Action = acConfiguracao
    end
    object miSobre: TMenuItem
      Action = acSobre
    end
  end
  object acAcao: TActionList
    Left = 16
    Top = 72
    object acSobre: TAction
      Category = 'Menu'
      Caption = 'Sobre'
      OnExecute = acSobreExecute
    end
    object acConfiguracao: TAction
      Category = 'Menu'
      Caption = 'Configura'#231#227'o'
      OnExecute = acConfiguracaoExecute
    end
    object acKey: TAction
      Category = 'Key'
      Caption = 'acF1'
      ShortCut = 112
      OnExecute = acKeyExecute
    end
    object acTransacao: TAction
      Category = 'Menu'
      Caption = 'Transa'#231#227'o'
      OnExecute = acTransacaoExecute
    end
    object acModelo: TAction
      Category = 'Menu'
      Caption = 'Modelo'
      OnExecute = acModeloExecute
    end
  end
end
