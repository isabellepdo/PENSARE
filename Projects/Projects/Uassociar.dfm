object Fassociar: TFassociar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fassociar'
  ClientHeight = 189
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 36
    Height = 13
    Caption = 'Bolsista'
  end
  object Label2: TLabel
    Left = 24
    Top = 101
    Width = 66
    Height = 13
    Caption = 'Numero do kit'
  end
  object cbbx: TComboBox
    Left = 24
    Top = 48
    Width = 425
    Height = 21
    TabOrder = 0
  end
  object cbbx2: TComboBox
    Left = 24
    Top = 120
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 296
    Top = 118
    Width = 153
    Height = 25
    Caption = 'cadastrar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
end
