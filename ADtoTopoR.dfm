object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'AD to TopoR Interface'
  ClientHeight = 183
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 53
    Height = 19
    Caption = 'TopoR:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 55
    Height = 19
    Caption = 'Project:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 144
    Top = 80
    Width = 91
    Height = 19
    Caption = 'Version FST:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object l_H: TLabel
    Left = 465
    Top = 112
    Width = 7
    Height = 13
    Caption = 'H'
  end
  object l_L: TLabel
    Left = 475
    Top = 112
    Width = 5
    Height = 13
    Caption = 'L'
  end
  object l_C: TLabel
    Left = 485
    Top = 112
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object l_LL: TLabel
    Left = 495
    Top = 112
    Width = 10
    Height = 13
    Caption = 'LL'
  end
  object l_N: TLabel
    Left = 510
    Top = 112
    Width = 7
    Height = 13
    Caption = 'N'
  end
  object l_G: TLabel
    Left = 520
    Top = 112
    Width = 7
    Height = 13
    Caption = 'G'
  end
  object l_R: TLabel
    Left = 536
    Top = 112
    Width = 7
    Height = 13
    Caption = 'R'
  end
  object bTopoR: TButton
    Left = 464
    Top = 16
    Width = 75
    Height = 21
    Caption = 'Open'
    TabOrder = 0
    OnClick = bTopoRClick
  end
  object tTopor: TEdit
    Left = 96
    Top = 16
    Width = 360
    Height = 21
    TabOrder = 1
    Text = 'C:\Program Files\TopoR Lite\BIN\topor.exe'
  end
  object b_GO: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Export FST'
    TabOrder = 2
    OnClick = b_GOClick
  end
  object tProject: TEdit
    Left = 96
    Top = 48
    Width = 360
    Height = 21
    TabOrder = 3
  end
  object bProject: TButton
    Left = 464
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 4
    OnClick = bProjectClick
  end
  object cbStartTopoR: TCheckBox
    Left = 8
    Top = 80
    Width = 112
    Height = 17
    Caption = 'Run TopoR?'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object cb_Version: TComboBox
    Left = 240
    Top = 80
    Width = 72
    Height = 21
    ItemIndex = 0
    TabOrder = 6
    Text = '1.1.3'
    Items.Strings = (
      '1.1.3'
      '1.1.4'
      '1.1.5')
  end
  object b_Import: TButton
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Import FST'
    TabOrder = 7
    OnClick = b_ImportClick
  end
  object tExport: TEdit
    Left = 96
    Top = 112
    Width = 360
    Height = 21
    TabOrder = 8
  end
  object tImport: TEdit
    Left = 96
    Top = 144
    Width = 360
    Height = 21
    TabOrder = 9
  end
end
