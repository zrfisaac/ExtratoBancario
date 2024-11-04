object frmModeloMenu: TfrmModeloMenu
  Left = 0
  Top = 0
  Caption = 'frmModeloMenu'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnFundo: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnRodape: TPanel
      Left = 0
      Top = 399
      Width = 624
      Height = 42
      Align = alBottom
      TabOrder = 0
      object pnRodape02: TPanel
        Left = 526
        Top = 1
        Width = 10
        Height = 40
        Align = alRight
        BevelOuter = bvNone
        Color = clFuchsia
        ParentBackground = False
        TabOrder = 0
        Visible = False
      end
      object pnRodape01: TPanel
        Left = 1
        Top = 1
        Width = 525
        Height = 40
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
      end
      object pnRodape03: TPanel
        Left = 536
        Top = 1
        Width = 87
        Height = 40
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
    object pnCorpo: TPanel
      Left = 0
      Top = 0
      Width = 624
      Height = 399
      Align = alClient
      TabOrder = 1
      object pcCorpo: TPageControl
        Left = 1
        Top = 1
        Width = 622
        Height = 397
        Align = alClient
        TabOrder = 0
      end
    end
  end
end
