object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'AD to TopoR Interface'
  ClientHeight = 327
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
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
    Left = 8
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
    Left = 9
    Top = 176
    Width = 7
    Height = 13
    Caption = 'H'
  end
  object l_L: TLabel
    Left = 19
    Top = 176
    Width = 5
    Height = 13
    Caption = 'L'
  end
  object l_C: TLabel
    Left = 29
    Top = 176
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object l_LL: TLabel
    Left = 39
    Top = 176
    Width = 10
    Height = 13
    Caption = 'LL'
  end
  object l_N: TLabel
    Left = 54
    Top = 176
    Width = 7
    Height = 13
    Caption = 'N'
  end
  object l_G: TLabel
    Left = 64
    Top = 176
    Width = 7
    Height = 13
    Caption = 'G'
  end
  object l_R: TLabel
    Left = 80
    Top = 176
    Width = 7
    Height = 13
    Caption = 'R'
  end
  object Label4: TLabel
    Left = 8
    Top = 144
    Width = 30
    Height = 19
    Caption = 'File:'
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
    Width = 30
    Height = 19
    Caption = 'File:'
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
  object l_D: TLabel
    Left = 92
    Top = 176
    Width = 7
    Height = 13
    Caption = 'D'
  end
  object InstrumentCaption3: TInstrumentCaption
    Left = 8
    Top = 293
    Width = 528
    Height = 16
    Caption = 'Status:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Arial Black'
    Font.Style = []
    ParentFont = False
  end
  object lbProcess: TXPLabel
    Left = 88
    Top = 293
    Width = 21
    Height = 16
    Caption = 'Go?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 168
    Top = 101
    Width = 90
    Height = 13
    Caption = '1.2.0 = TopoR 6.2'
  end
  object Label7: TLabel
    Left = 168
    Top = 89
    Width = 100
    Height = 13
    Caption = '1.1.4 = TopoR 6.1.5'
  end
  object Label8: TLabel
    Left = 168
    Top = 77
    Width = 100
    Height = 13
    Caption = '1.1.3 = TopoR 6.1.4'
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
  end
  object tProject: TEdit
    Left = 96
    Top = 48
    Width = 360
    Height = 21
    TabOrder = 2
  end
  object bProject: TButton
    Left = 464
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 3
    OnClick = bProjectClick
  end
  object cbStartTopoR: TCheckBox
    Left = 144
    Top = 176
    Width = 112
    Height = 17
    Caption = 'Run TopoR?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object cb_Text: TXPCheckBox
    Left = 264
    Top = 264
    Width = 48
    Height = 17
    Caption = 'Text'
    TabOrder = 5
    State = cbChecked
  end
  object bt_ConfSave: TXPButton
    Left = 464
    Top = 80
    Width = 72
    Height = 24
    Caption = 'Config Save'
    ParentColor = False
    TabOrder = 6
    TabStop = False
    OnClick = bt_ConfSaveClick
  end
  object cbPrimitive: TXPCheckBox
    Left = 312
    Top = 264
    Width = 64
    Height = 17
    Caption = 'Primitive'
    TabOrder = 7
    State = cbChecked
  end
  object cbFreePad: TXPCheckBox
    Left = 192
    Top = 264
    Width = 64
    Height = 17
    Caption = 'Free Pad'
    TabOrder = 8
    State = cbChecked
  end
  object cbTrack: TXPCheckBox
    Left = 8
    Top = 264
    Width = 56
    Height = 17
    Caption = 'Track'
    TabOrder = 9
    State = cbChecked
  end
  object cbVia: TXPCheckBox
    Left = 72
    Top = 264
    Width = 32
    Height = 17
    Caption = 'Via'
    TabOrder = 10
    State = cbChecked
  end
  object cbComponent: TXPCheckBox
    Left = 112
    Top = 264
    Width = 72
    Height = 17
    Caption = 'Component'
    TabOrder = 11
    State = cbChecked
  end
  object cb_FootComp: TXPCheckBox
    Left = 272
    Top = 179
    Width = 128
    Height = 17
    Caption = 'Footprint(RC) Compare'
    TabOrder = 12
    State = cbChecked
  end
  object b_GO: TXPButton
    Left = 464
    Top = 173
    Width = 72
    Height = 24
    Caption = 'Export FST'
    ParentColor = False
    TabOrder = 13
    TabStop = False
    OnClick = b_GOClick
  end
  object b_Import: TXPButton
    Left = 464
    Top = 261
    Width = 72
    Height = 24
    Caption = 'Import FST'
    ParentColor = False
    TabOrder = 14
    TabStop = False
    OnClick = b_ImportClick
  end
  object cb_Version: TComboBox
    Left = 104
    Top = 80
    Width = 56
    Height = 21
    TabOrder = 15
    Text = '1.1.4'
    Items.Strings = (
      '1.1.3'
      '1.1.4'
      '1.2.0')
  end
  object tExport: TEdit
    Left = 40
    Top = 144
    Width = 416
    Height = 21
    TabOrder = 16
  end
  object b_file_export: TButton
    Left = 464
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Change File'
    TabOrder = 17
    OnClick = b_file_exportClick
  end
  object b_file_import: TButton
    Left = 464
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 18
    OnClick = b_file_importClick
  end
  object tImport: TEdit
    Left = 40
    Top = 232
    Width = 416
    Height = 21
    TabOrder = 19
  end
  object Log: TMemo
    Left = 8
    Top = 328
    Width = 528
    Height = 176
    TabOrder = 20
  end
  object b_Log: TButton
    Left = 8
    Top = 312
    Width = 528
    Height = 16
    Caption = ' \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/ '
    TabOrder = 21
    OnClick = b_LogClick
  end
end
