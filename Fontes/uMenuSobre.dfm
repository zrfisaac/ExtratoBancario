object frmMenuSobre: TfrmMenuSobre
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sobre'
  ClientHeight = 161
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 161
    Align = alClient
    BevelOuter = bvNone
    Color = 2367774
    ParentBackground = False
    TabOrder = 0
    object pnFundo01: TPanel
      Left = 0
      Top = 0
      Width = 153
      Height = 161
      Align = alLeft
      BevelOuter = bvNone
      Color = 2367774
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 16
        Width = 137
        Height = 45
        Alignment = taCenter
        AutoSize = False
        Caption = '</>'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -35
        Font.Name = 'Segoe UI Black'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 67
        Width = 137
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = 'Isaac Caires'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 105
        Width = 137
        Height = 32
        Alignment = taCenter
        AutoSize = False
        Caption = 'Software Developer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnFundo02: TPanel
      Left = 153
      Top = 0
      Width = 9
      Height = 161
      Align = alLeft
      BevelOuter = bvNone
      Color = clFuchsia
      ParentBackground = False
      TabOrder = 1
      Visible = False
    end
    object Panel1: TPanel
      Left = 162
      Top = 0
      Width = 162
      Height = 161
      Align = alClient
      BevelOuter = bvNone
      Color = 2367774
      ParentBackground = False
      TabOrder = 2
    end
  end
  object acAcao: TActionList
    Left = 8
    Top = 8
    object acEsc: TAction
      Category = 'Key'
      Caption = 'Esc'
      ShortCut = 27
      OnExecute = acEscExecute
    end
    object acEnter: TAction
      Category = 'Key'
      Caption = 'acEnter'
      ShortCut = 13
      OnExecute = acEnterExecute
    end
  end
end
