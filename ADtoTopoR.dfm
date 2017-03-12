object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'AD to TopoR Interface'
  ClientHeight = 305
  ClientWidth = 551
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
    Enabled = False
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
    Enabled = False
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
    Left = 97
    Top = 176
    Width = 7
    Height = 13
    Caption = 'H'
  end
  object l_L: TLabel
    Left = 107
    Top = 176
    Width = 5
    Height = 13
    Caption = 'L'
  end
  object l_C: TLabel
    Left = 117
    Top = 176
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object l_LL: TLabel
    Left = 127
    Top = 176
    Width = 10
    Height = 13
    Caption = 'LL'
  end
  object l_N: TLabel
    Left = 142
    Top = 176
    Width = 7
    Height = 13
    Caption = 'N'
  end
  object l_G: TLabel
    Left = 152
    Top = 176
    Width = 7
    Height = 13
    Caption = 'G'
  end
  object l_R: TLabel
    Left = 168
    Top = 176
    Width = 7
    Height = 13
    Caption = 'R'
  end
  object Label4: TLabel
    Left = 8
    Top = 144
    Width = 71
    Height = 19
    Caption = 'Export to:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 232
    Width = 74
    Height = 19
    Caption = 'Import to:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object InstrumentCaption1: TInstrumentCaption
    Left = 8
    Top = 120
    Width = 528
    Height = 14
    Caption = 'Export to TopoR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
  end
  object InstrumentCaption2: TInstrumentCaption
    Left = 8
    Top = 208
    Width = 528
    Height = 14
    Caption = 'Import from TopoR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
  end
  object bTopoR: TButton
    Left = 464
    Top = 16
    Width = 75
    Height = 21
    Caption = 'Open'
    Enabled = False
    TabOrder = 0
    OnClick = bTopoRClick
  end
  object tTopor: TEdit
    Left = 96
    Top = 16
    Width = 360
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'C:\Program Files\TopoR Lite\BIN\topor.exe'
  end
  object b_GO: TButton
    Left = 464
    Top = 176
    Width = 72
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
    Enabled = False
    TabOrder = 3
  end
  object bProject: TButton
    Left = 464
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Open'
    Enabled = False
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
    Left = 464
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Import FST'
    TabOrder = 7
    OnClick = b_ImportClick
  end
  object tExport: TEdit
    Left = 88
    Top = 144
    Width = 368
    Height = 21
    TabOrder = 8
  end
  object tImport: TEdit
    Left = 88
    Top = 232
    Width = 368
    Height = 21
    TabOrder = 9
  end
  object b_ExportFolder: TButton
    Left = 464
    Top = 144
    Width = 72
    Height = 25
    Caption = 'Browse..'
    TabOrder = 10
    OnClick = b_ExportFolderClick
  end
  object b_ImportFolder: TButton
    Left = 464
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Browse..'
    TabOrder = 11
    OnClick = b_ImportFolderClick
  end
  object cbFreePad: TCheckBox
    Left = 208
    Top = 264
    Width = 97
    Height = 17
    Caption = 'Free Pad'
    Enabled = False
    TabOrder = 12
  end
  object cbTrack: TCheckBox
    Left = 16
    Top = 264
    Width = 48
    Height = 17
    Caption = 'Track'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object cbVia: TCheckBox
    Left = 80
    Top = 264
    Width = 48
    Height = 17
    Caption = 'Via'
    Checked = True
    State = cbChecked
    TabOrder = 14
  end
  object cbComponent: TCheckBox
    Left = 120
    Top = 264
    Width = 80
    Height = 17
    Caption = 'Component'
    Checked = True
    State = cbChecked
    TabOrder = 15
  end
end
