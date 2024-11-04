inherited frmMenuTransacao: TfrmMenuTransacao
  Caption = 'frmMenuTransacao'
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  TextHeight = 15
  inherited pnFundo: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pnRodape: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited pnRodape02: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
      inherited pnRodape01: TPanel
        StyleElements = [seFont, seClient, seBorder]
        object btNovo: TBitBtn
          Left = 6
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          Enabled = False
          TabOrder = 0
          OnClick = btNovoClick
        end
        object btEditar: TBitBtn
          Left = 87
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Editar'
          Enabled = False
          TabOrder = 1
          OnClick = btEditarClick
        end
        object btCancelar: TBitBtn
          Left = 168
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 2
          OnClick = btCancelarClick
        end
        object btSalvar: TBitBtn
          Left = 249
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Salvar'
          Enabled = False
          TabOrder = 3
          OnClick = btSalvarClick
        end
        object btApagar: TBitBtn
          Left = 330
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Apagar'
          Enabled = False
          TabOrder = 4
          OnClick = btApagarClick
        end
      end
      inherited pnRodape03: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited pnCorpo: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited pcCorpo: TPageControl
        ActivePage = tsCadastro
        object tsConsulta: TTabSheet
          Caption = 'tsConsulta'
          object pnConsulta: TPanel
            Left = 0
            Top = 0
            Width = 614
            Height = 367
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object dbgConsulta: TDBGrid
              Left = 0
              Top = 0
              Width = 614
              Height = 367
              Align = alClient
              DataSource = dtmDataPrincipal.dtsPrincipal
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnDblClick = dbgConsultaDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CL_DATA'
                  Title.Caption = 'Data'
                  Width = 93
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CL_NOME'
                  Title.Caption = 'Nome'
                  Width = 312
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CL_VALOR'
                  Title.Caption = 'Valor'
                  Width = 84
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CL_TIPO'
                  Title.Caption = 'Tipo'
                  Width = 98
                  Visible = True
                end>
            end
          end
        end
        object tsCadastro: TTabSheet
          Caption = 'tsCadastro'
          ImageIndex = 1
          object pnCadastro: TPanel
            Left = 0
            Top = 0
            Width = 614
            Height = 367
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object sbCadastro: TScrollBox
              Left = 0
              Top = 0
              Width = 614
              Height = 367
              Align = alClient
              Color = clGray
              ParentColor = False
              TabOrder = 0
              object pnCadastroId: TPanel
                Left = 0
                Top = 0
                Width = 610
                Height = 65
                Align = alTop
                ParentBackground = False
                TabOrder = 0
                object lbCadastroId: TLabel
                  Left = 8
                  Top = 8
                  Width = 11
                  Height = 15
                  Caption = 'ID'
                end
                object Label1: TLabel
                  Left = 112
                  Top = 8
                  Width = 24
                  Height = 15
                  Caption = 'Data'
                end
                object lbCadastroValor: TLabel
                  Left = 216
                  Top = 8
                  Width = 26
                  Height = 15
                  Caption = 'Valor'
                end
                object Label4: TLabel
                  Left = 324
                  Top = 8
                  Width = 24
                  Height = 15
                  Caption = 'Tipo'
                end
                object edCadastroId: TEdit
                  Left = 8
                  Top = 29
                  Width = 89
                  Height = 23
                  ReadOnly = True
                  TabOrder = 0
                end
                object dtCadastroData: TDateTimePicker
                  Left = 112
                  Top = 29
                  Width = 89
                  Height = 23
                  Date = 45599.000000000000000000
                  Time = 0.657267766204313400
                  TabOrder = 1
                end
                object cbCadastroTipo: TComboBox
                  Left = 324
                  Top = 29
                  Width = 145
                  Height = 23
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 3
                  Text = 'Cr'#233'dito'
                  Items.Strings = (
                    'Cr'#233'dito'
                    'D'#233'bito')
                end
                object edCadastroValor: TEdit
                  Left = 216
                  Top = 29
                  Width = 89
                  Height = 23
                  TabOrder = 2
                  OnKeyPress = edCadastroValorKeyPress
                end
              end
              object Panel2: TPanel
                Left = 0
                Top = 65
                Width = 610
                Height = 65
                Align = alTop
                ParentBackground = False
                TabOrder = 1
                object lbCadastroNome: TLabel
                  Left = 8
                  Top = 8
                  Width = 33
                  Height = 15
                  Caption = 'Nome'
                end
                object edCadastroNome: TEdit
                  Left = 8
                  Top = 29
                  Width = 593
                  Height = 23
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
    end
  end
end
