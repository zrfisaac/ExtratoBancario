inherited frmMenuConfiguracao: TfrmMenuConfiguracao
  Caption = 'frmMenuConfiguracao'
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  TextHeight = 15
  inherited pnFundo: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pnRodape: TPanel
      Visible = False
      StyleElements = [seFont, seClient, seBorder]
      inherited pnRodape02: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnRodape01: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnRodape03: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited pnCorpo: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited pcCorpo: TPageControl
        ActivePage = tsConexao
        object tsConexao: TTabSheet
          Caption = 'Conex'#227'o'
          object pnConexao: TPanel
            Left = 0
            Top = 0
            Width = 614
            Height = 367
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object pnConexaoRodape: TPanel
              Left = 0
              Top = 325
              Width = 614
              Height = 42
              Align = alBottom
              TabOrder = 0
              object pnConexaoRodape02: TPanel
                Left = 516
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
              object pnConexaoRodape01: TPanel
                Left = 1
                Top = 1
                Width = 515
                Height = 40
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object btConexao: TBitBtn
                  Left = 9
                  Top = 5
                  Width = 75
                  Height = 25
                  Caption = 'Conex'#227'o'
                  TabOrder = 0
                  OnClick = btConexaoClick
                end
              end
              object pnConexaoRodape03: TPanel
                Left = 526
                Top = 1
                Width = 87
                Height = 40
                Align = alRight
                BevelOuter = bvNone
                TabOrder = 2
              end
            end
            object sbCadastro: TScrollBox
              Left = 0
              Top = 0
              Width = 614
              Height = 325
              Align = alClient
              Color = clGray
              ParentColor = False
              TabOrder = 1
              object pnConexaoServidor: TPanel
                Left = 0
                Top = 0
                Width = 610
                Height = 65
                Align = alTop
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  610
                  65)
                object lbConexaoServidor: TLabel
                  Left = 8
                  Top = 8
                  Width = 43
                  Height = 15
                  Caption = 'Servidor'
                end
                object lbConexaoPorta: TLabel
                  Left = 524
                  Top = 8
                  Width = 28
                  Height = 15
                  Anchors = [akTop, akRight]
                  Caption = 'Porta'
                end
                object edConexaoServidor: TEdit
                  Left = 8
                  Top = 29
                  Width = 510
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Text = '127.0.0.1'
                end
                object edConexaoPorta: TEdit
                  Left = 524
                  Top = 29
                  Width = 74
                  Height = 23
                  Anchors = [akTop, akRight]
                  TabOrder = 1
                  Text = '3050'
                end
              end
              object Panel5: TPanel
                Left = 0
                Top = 65
                Width = 610
                Height = 65
                Align = alTop
                ParentBackground = False
                TabOrder = 1
                DesignSize = (
                  610
                  65)
                object lbConexaoBanco: TLabel
                  Left = 8
                  Top = 8
                  Width = 33
                  Height = 15
                  Caption = 'Banco'
                end
                object edConexaoBanco: TEdit
                  Left = 8
                  Top = 29
                  Width = 590
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Text = 'BANCO.fdb'
                end
              end
              object pnConexaoUsuario: TPanel
                Left = 0
                Top = 130
                Width = 610
                Height = 65
                Align = alTop
                ParentBackground = False
                TabOrder = 2
                DesignSize = (
                  610
                  65)
                object lbConexaoUsuario: TLabel
                  Left = 8
                  Top = 8
                  Width = 40
                  Height = 15
                  Caption = 'Usu'#225'rio'
                end
                object edConexaoUsuario: TEdit
                  Left = 8
                  Top = 29
                  Width = 590
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Text = 'SYSDBA'
                end
              end
              object pnConexaoSenha: TPanel
                Left = 0
                Top = 195
                Width = 610
                Height = 65
                Align = alTop
                ParentBackground = False
                TabOrder = 3
                DesignSize = (
                  610
                  65)
                object lbConexaoSenha: TLabel
                  Left = 8
                  Top = 8
                  Width = 32
                  Height = 15
                  Caption = 'Senha'
                end
                object edConexaoSenha: TEdit
                  Left = 8
                  Top = 29
                  Width = 590
                  Height = 23
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  Text = 'masterkey'
                end
              end
            end
          end
        end
      end
    end
  end
end
