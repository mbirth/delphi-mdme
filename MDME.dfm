object Form1: TForm1
  Left = 190
  Top = 104
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'MDME - MilkDrop Message Editor --- (c)2002 by Markus Birth <mbir' +
    'th@webwriters.de>'
  ClientHeight = 554
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainPageControl: TPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 553
    ActivePage = TabSheet6
    RaggedRight = True
    TabIndex = 2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Messages'
      object MessageExample: TLabel
        Left = 224
        Top = 0
        Width = 513
        Height = 129
        Alignment = taCenter
        Caption = 'Example'
        Color = clBlack
        Constraints.MaxHeight = 129
        Constraints.MaxWidth = 513
        Constraints.MinHeight = 129
        Constraints.MinWidth = 513
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -85
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object Label18: TLabel
        Left = 432
        Top = 248
        Width = 3
        Height = 13
      end
      object Messages: TListBox
        Left = 0
        Top = 0
        Width = 217
        Height = 521
        ItemHeight = 13
        TabOrder = 0
        OnClick = MessagesClick
      end
      object MessageText: TEdit
        Left = 224
        Top = 128
        Width = 513
        Height = 21
        TabOrder = 1
        OnChange = MessageTextChange
      end
      object GroupBox3: TGroupBox
        Left = 680
        Top = 168
        Width = 81
        Height = 89
        Caption = 'Changes'
        TabOrder = 2
        object SaveMessage: TButton
          Left = 8
          Top = 16
          Width = 65
          Height = 33
          Caption = 'SAVE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = SaveMessageClick
        end
        object DiscardMessage: TButton
          Left = 8
          Top = 48
          Width = 65
          Height = 17
          Caption = 'Discard'
          TabOrder = 1
          OnClick = DiscardMessageClick
        end
        object DelMessage: TButton
          Left = 8
          Top = 64
          Width = 65
          Height = 17
          Caption = 'DEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = DelMessageClick
        end
      end
      object PageControl1: TPageControl
        Left = 224
        Top = 152
        Width = 449
        Height = 369
        ActivePage = TabSheet3
        TabIndex = 0
        TabOrder = 3
        object TabSheet3: TTabSheet
          Caption = 'Font'
          object Label2: TLabel
            Left = 0
            Top = 8
            Width = 61
            Height = 13
            Caption = 'Font presets:'
          end
          object MFont: TListBox
            Left = 0
            Top = 20
            Width = 145
            Height = 197
            ItemHeight = 13
            TabOrder = 0
            OnClick = MFontClick
          end
          object cbFontOver: TCheckBox
            Left = 248
            Top = 4
            Width = 97
            Height = 17
            Hint = 'Overrides the font-face of the font-preset.'
            Caption = 'Font override:'
            TabOrder = 1
            OnClick = cbFontOverClick
          end
          object MFontOver: TListBox
            Left = 248
            Top = 20
            Width = 145
            Height = 197
            Enabled = False
            ItemHeight = 13
            TabOrder = 2
            OnClick = MFontOverClick
          end
          object GroupBox6: TGroupBox
            Left = 24
            Top = 240
            Width = 377
            Height = 81
            Caption = 'Advanced Font settings'
            TabOrder = 3
            object Label12: TLabel
              Left = 12
              Top = 20
              Width = 45
              Height = 13
              Caption = 'Font size:'
            end
            object Label13: TLabel
              Left = 63
              Top = 39
              Width = 70
              Height = 13
              Caption = 'almost invisible'
            end
            object Label14: TLabel
              Left = 316
              Top = 39
              Width = 46
              Height = 13
              Caption = 'enormous'
            end
            object MFontSize: TTrackBar
              Left = 56
              Top = 16
              Width = 313
              Height = 25
              Hint = 'Sets the font-size from 0 (left) up to 100 (right).'
              Max = 100
              Orientation = trHorizontal
              Frequency = 10
              Position = 1
              SelEnd = 0
              SelStart = 0
              TabOrder = 0
              ThumbLength = 15
              TickMarks = tmBottomRight
              TickStyle = tsAuto
              OnChange = MFontSizeChange
            end
            object cbBoldOverOn: TCheckBox
              Left = 64
              Top = 56
              Width = 89
              Height = 17
              Hint = 'Overrides the bold-attribute of the font-preset.'
              Caption = 'bold override:'
              TabOrder = 1
              OnClick = cbBoldOverOnClick
            end
            object cbBoldOver: TCheckBox
              Left = 152
              Top = 56
              Width = 49
              Height = 17
              Caption = 'bold'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = cbBoldOverClick
            end
            object cbItalOver: TCheckBox
              Left = 320
              Top = 56
              Width = 49
              Height = 17
              Caption = 'italic'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsItalic]
              ParentFont = False
              TabOrder = 3
              OnClick = cbItalOverClick
            end
            object cbItalOverOn: TCheckBox
              Left = 232
              Top = 56
              Width = 89
              Height = 17
              Hint = 'Overrides the italic-attribute of the font-preset.'
              Caption = 'italic override:'
              TabOrder = 4
              OnClick = cbItalOverOnClick
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Color'
          ImageIndex = 1
          object GroupBox4: TGroupBox
            Left = 8
            Top = 12
            Width = 425
            Height = 185
            Caption = 'Message Color'
            TabOrder = 0
            object MColorSample: TLabel
              Left = 328
              Top = 39
              Width = 87
              Height = 138
              Alignment = taCenter
              Caption = 'Color sample'
              Color = clWhite
              Constraints.MaxHeight = 138
              Constraints.MaxWidth = 87
              Constraints.MinHeight = 138
              Constraints.MinWidth = 87
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object Label7: TLabel
              Left = 11
              Top = 42
              Width = 14
              Height = 20
              Caption = 'R'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 11
              Top = 90
              Width = 15
              Height = 20
              Caption = 'G'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clLime
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 11
              Top = 138
              Width = 13
              Height = 20
              Caption = 'B'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 96
              Top = 64
              Width = 73
              Height = 13
              Caption = 'Randomization:'
            end
            object Label10: TLabel
              Left = 96
              Top = 112
              Width = 73
              Height = 13
              Caption = 'Randomization:'
            end
            object Label11: TLabel
              Left = 96
              Top = 160
              Width = 73
              Height = 13
              Caption = 'Randomization:'
            end
            object Label27: TLabel
              Left = 147
              Top = 17
              Width = 172
              Height = 13
              Caption = '(Randomization is always adjustable)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object MColR: TTrackBar
              Left = 24
              Top = 40
              Width = 300
              Height = 25
              Enabled = False
              Max = 255
              Orientation = trHorizontal
              Frequency = 32
              Position = 255
              SelEnd = 0
              SelStart = 0
              TabOrder = 0
              ThumbLength = 15
              TickMarks = tmBottomRight
              TickStyle = tsAuto
              OnChange = MColRChange
            end
            object MColG: TTrackBar
              Left = 24
              Top = 88
              Width = 300
              Height = 25
              Enabled = False
              Max = 255
              Orientation = trHorizontal
              Frequency = 32
              Position = 255
              SelEnd = 0
              SelStart = 0
              TabOrder = 1
              ThumbLength = 15
              TickMarks = tmBottomRight
              TickStyle = tsAuto
              OnChange = MColGChange
            end
            object MColB: TTrackBar
              Left = 24
              Top = 136
              Width = 300
              Height = 25
              Enabled = False
              Max = 255
              Orientation = trHorizontal
              Frequency = 32
              Position = 255
              SelEnd = 0
              SelStart = 0
              TabOrder = 2
              ThumbLength = 15
              TickMarks = tmBottomRight
              TickStyle = tsAuto
              OnChange = MColBChange
            end
            object MVarR: TTrackBar
              Left = 168
              Top = 64
              Width = 150
              Height = 17
              Max = 255
              Orientation = trHorizontal
              Frequency = 32
              Position = 0
              SelEnd = 0
              SelStart = 0
              TabOrder = 3
              ThumbLength = 10
              TickMarks = tmBottomRight
              TickStyle = tsAuto
            end
            object MVarG: TTrackBar
              Left = 168
              Top = 112
              Width = 150
              Height = 17
              Max = 255
              Orientation = trHorizontal
              Frequency = 32
              Position = 0
              SelEnd = 0
              SelStart = 0
              TabOrder = 4
              ThumbLength = 10
              TickMarks = tmBottomRight
              TickStyle = tsAuto
            end
            object MVarB: TTrackBar
              Left = 168
              Top = 160
              Width = 150
              Height = 17
              Max = 255
              Orientation = trHorizontal
              Frequency = 32
              Position = 0
              SelEnd = 0
              SelStart = 0
              TabOrder = 5
              ThumbLength = 10
              TickMarks = tmBottomRight
              TickStyle = tsAuto
            end
            object cbDefFont: TCheckBox
              Left = 8
              Top = 16
              Width = 113
              Height = 17
              Hint = 'Overrides the font-color of the font preset.'
              Caption = 'Font color override'
              TabOrder = 6
              OnClick = cbDefFontClick
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Position && Time'
          ImageIndex = 2
          object GroupBox5: TGroupBox
            Left = 8
            Top = 8
            Width = 209
            Height = 329
            Caption = 'Position on screen'
            TabOrder = 0
            object MScreen: TImage
              Left = 33
              Top = 24
              Width = 161
              Height = 121
              Cursor = crCross
              OnMouseDown = MScreenMouseDown
            end
            object Label28: TLabel
              Left = 8
              Top = 192
              Width = 73
              Height = 13
              Caption = 'Randomization:'
            end
            object Label29: TLabel
              Left = 7
              Top = 211
              Width = 7
              Height = 13
              Caption = 'X'
            end
            object Label30: TLabel
              Left = 7
              Top = 235
              Width = 7
              Height = 13
              Caption = 'Y'
            end
            object Label31: TLabel
              Left = 25
              Top = 255
              Width = 6
              Height = 13
              Caption = '0'
            end
            object Label32: TLabel
              Left = 184
              Top = 254
              Width = 19
              Height = 13
              Caption = 'max'
            end
            object Label34: TLabel
              Left = 5
              Top = 176
              Width = 201
              Height = 13
              Caption = '(The text will appear inside the yellow box.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Transparent = True
            end
            object Label15: TLabel
              Left = 6
              Top = 280
              Width = 31
              Height = 13
              Caption = 'Effect:'
            end
            object Label16: TLabel
              Left = 22
              Top = 296
              Width = 28
              Height = 26
              Alignment = taRightJustify
              Caption = #188' shrink'
              WordWrap = True
            end
            object Label17: TLabel
              Left = 182
              Top = 296
              Width = 23
              Height = 26
              Alignment = taCenter
              Caption = '4x grow'
              Transparent = True
              WordWrap = True
            end
            object Label19: TLabel
              Left = 74
              Top = 295
              Width = 3
              Height = 13
              Caption = 'I'
            end
            object Label26: TLabel
              Left = 123
              Top = 296
              Width = 23
              Height = 26
              Alignment = taCenter
              Caption = '2x grow'
              WordWrap = True
            end
            object MPosX: TTrackBar
              Left = 24
              Top = 145
              Width = 177
              Height = 29
              Max = 10000
              Orientation = trHorizontal
              Frequency = 1000
              Position = 5000
              SelEnd = 0
              SelStart = 0
              TabOrder = 0
              ThumbLength = 15
              TickMarks = tmTopLeft
              TickStyle = tsAuto
              OnChange = MPosXChange
            end
            object MPosY: TTrackBar
              Left = 8
              Top = 16
              Width = 25
              Height = 137
              Max = 10000
              Orientation = trVertical
              Frequency = 1000
              Position = 5000
              SelEnd = 0
              SelStart = 0
              TabOrder = 1
              ThumbLength = 15
              TickMarks = tmBottomRight
              TickStyle = tsAuto
              OnChange = MPosYChange
            end
            object MRandX: TTrackBar
              Left = 19
              Top = 208
              Width = 182
              Height = 25
              Max = 10000
              Orientation = trHorizontal
              Frequency = 1000
              Position = 0
              SelEnd = 0
              SelStart = 0
              TabOrder = 2
              ThumbLength = 15
              TickMarks = tmBottomRight
              TickStyle = tsAuto
              OnChange = MRandXChange
            end
            object MRandY: TTrackBar
              Left = 19
              Top = 232
              Width = 182
              Height = 25
              Max = 10000
              Orientation = trHorizontal
              Frequency = 1000
              Position = 0
              SelEnd = 0
              SelStart = 0
              TabOrder = 3
              ThumbLength = 15
              TickMarks = tmBottomRight
              TickStyle = tsAuto
              OnChange = MRandYChange
            end
            object MFontGrow: TTrackBar
              Left = 39
              Top = 280
              Width = 162
              Height = 17
              Hint = 
                'Sets the shrink/grow-effect of the message from 1/4th (left) up ' +
                'to 4x (right) the initial size of the text.'
              Max = 400
              Min = 25
              Orientation = trHorizontal
              Frequency = 75
              Position = 100
              SelEnd = 0
              SelStart = 0
              TabOrder = 4
              ThumbLength = 10
              TickMarks = tmBottomRight
              TickStyle = tsAuto
            end
            object Button1: TButton
              Left = 60
              Top = 305
              Width = 33
              Height = 17
              Hint = 'Disables the text effect.'
              Caption = 'no fx'
              TabOrder = 5
              OnClick = Button1Click
            end
          end
          object GroupBox7: TGroupBox
            Left = 240
            Top = 8
            Width = 185
            Height = 81
            Caption = 'Message Time'
            TabOrder = 1
            object Label21: TLabel
              Left = 106
              Top = 24
              Width = 5
              Height = 13
              Caption = 's'
            end
            object Label22: TLabel
              Left = 160
              Top = 25
              Width = 13
              Height = 13
              Caption = 'ms'
            end
            object Label24: TLabel
              Left = 156
              Top = 64
              Width = 26
              Height = 13
              Caption = '100%'
            end
            object Label23: TLabel
              Left = 52
              Top = 64
              Width = 14
              Height = 13
              Caption = '0%'
            end
            object Label25: TLabel
              Left = 5
              Top = 49
              Width = 43
              Height = 13
              Caption = 'Fading %'
            end
            object MTimeS: TSpinEdit
              Left = 56
              Top = 19
              Width = 49
              Height = 22
              Hint = 'The time the message should be displayed. (0-999)'
              MaxValue = 999
              MinValue = 0
              TabOrder = 0
              Value = 0
            end
            object MTimeMS: TSpinEdit
              Left = 112
              Top = 19
              Width = 49
              Height = 22
              Hint = 'The time the message should be displayed. (0.0 - 0.999)'
              Increment = 50
              MaxValue = 1000
              MinValue = -1
              TabOrder = 1
              Value = 0
              OnChange = MTimeMSChange
            end
            object MTimeFade: TTrackBar
              Left = 48
              Top = 48
              Width = 129
              Height = 17
              Hint = 'Percentage of the time the text should fade in. (0-100%)'
              Max = 10000
              Orientation = trHorizontal
              Frequency = 1000
              Position = 3000
              SelEnd = 0
              SelStart = 0
              TabOrder = 2
              ThumbLength = 10
              TickMarks = tmBottomRight
              TickStyle = tsAuto
            end
          end
          object GroupBox8: TGroupBox
            Left = 240
            Top = 120
            Width = 185
            Height = 201
            Caption = 'Preview'
            TabOrder = 2
            object Preview: TImage
              Left = 11
              Top = 24
              Width = 161
              Height = 121
            end
            object PreviewButton: TButton
              Left = 11
              Top = 147
              Width = 161
              Height = 25
              Hint = 'Push to preview your effect.'
              Caption = 'Preview effect'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = PreviewButtonClick
            end
            object AbortPreview: TButton
              Left = 11
              Top = 172
              Width = 161
              Height = 16
              Hint = 'Push to abort a currently running preview.'
              Caption = 'Abort Preview'
              Enabled = False
              TabOrder = 1
              OnClick = AbortPreviewClick
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Fonts'
      ImageIndex = 1
      object Label1: TLabel
        Left = 160
        Top = 0
        Width = 68
        Height = 13
        Caption = 'Installed fonts:'
      end
      object FontExample: TLabel
        Left = 304
        Top = 224
        Width = 425
        Height = 105
        Alignment = taCenter
        Caption = 'Example'
        Color = clBlack
        Constraints.MaxHeight = 105
        Constraints.MaxWidth = 425
        Constraints.MinHeight = 105
        Constraints.MinWidth = 425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -64
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object Fonts: TListBox
        Left = 0
        Top = 0
        Width = 145
        Height = 521
        ItemHeight = 13
        TabOrder = 0
        OnClick = FontsClick
      end
      object FontSelector: TListBox
        Left = 160
        Top = 16
        Width = 137
        Height = 505
        ItemHeight = 13
        TabOrder = 1
        OnClick = FontSelectorClick
      end
      object cbBold: TCheckBox
        Left = 304
        Top = 16
        Width = 57
        Height = 17
        Caption = 'bold'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = cbBoldClick
      end
      object cbItal: TCheckBox
        Left = 304
        Top = 48
        Width = 57
        Height = 17
        Caption = 'italic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
        TabOrder = 3
        OnClick = cbItalClick
      end
      object GroupBox1: TGroupBox
        Left = 544
        Top = 16
        Width = 185
        Height = 57
        Caption = 'Changes'
        TabOrder = 4
        object SaveFont: TButton
          Left = 8
          Top = 16
          Width = 121
          Height = 33
          Caption = 'SAVE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = SaveFontClick
        end
        object DiscardFont: TButton
          Left = 128
          Top = 16
          Width = 51
          Height = 17
          Caption = 'Discard'
          TabOrder = 1
          OnClick = DiscardFontClick
        end
        object DelFont: TButton
          Left = 128
          Top = 32
          Width = 51
          Height = 17
          Caption = 'DEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = DelFontClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 304
        Top = 88
        Width = 425
        Height = 113
        Caption = 'Default Font Color'
        TabOrder = 5
        object FColorSample: TLabel
          Left = 328
          Top = 15
          Width = 87
          Height = 90
          Alignment = taCenter
          Caption = 'Color sample'
          Color = clWhite
          Constraints.MaxHeight = 90
          Constraints.MaxWidth = 87
          Constraints.MinHeight = 90
          Constraints.MinWidth = 87
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
        end
        object Label3: TLabel
          Left = 11
          Top = 18
          Width = 14
          Height = 20
          Caption = 'R'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 11
          Top = 50
          Width = 15
          Height = 20
          Caption = 'G'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clLime
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 11
          Top = 82
          Width = 13
          Height = 20
          Caption = 'B'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object FColR: TTrackBar
          Left = 24
          Top = 16
          Width = 300
          Height = 25
          Max = 255
          Orientation = trHorizontal
          Frequency = 32
          Position = 255
          SelEnd = 0
          SelStart = 0
          TabOrder = 0
          ThumbLength = 15
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = FColRChange
        end
        object FColG: TTrackBar
          Left = 24
          Top = 48
          Width = 300
          Height = 25
          Max = 255
          Orientation = trHorizontal
          Frequency = 32
          Position = 255
          SelEnd = 0
          SelStart = 0
          TabOrder = 1
          ThumbLength = 15
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = FColGChange
        end
        object FColB: TTrackBar
          Left = 24
          Top = 80
          Width = 300
          Height = 25
          Max = 255
          Orientation = trHorizontal
          Frequency = 32
          Position = 255
          SelEnd = 0
          SelStart = 0
          TabOrder = 2
          ThumbLength = 15
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = FColBChange
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'About...'
      ImageIndex = 2
      object Label33: TLabel
        Left = 136
        Top = -20
        Width = 431
        Height = 151
        Caption = 'MDME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -136
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 136
        Top = 96
        Width = 421
        Height = 47
        Caption = 'MilkDrop Message Editor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -40
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = True
      end
      object Label35: TLabel
        Left = 216
        Top = 144
        Width = 231
        Height = 13
        Caption = '(c)2002 by Markus Birth <mbirth@webwriters.de>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 168
        Top = 464
        Width = 438
        Height = 38
        Caption = 
          'If you have any comments or just want to say that you like it, c' +
          'ontact me via ICQ No. 2787089 or via eMail under mbirth@webwrite' +
          'rs.de .'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object IniPath: TLabel
        Left = 40
        Top = 512
        Width = 673
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'IniPath'
        Enabled = False
      end
      object Memo1: TMemo
        Left = 40
        Top = 176
        Width = 681
        Height = 249
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          
            'I wrote this little app because I found it difficult to define c' +
            'ool text-messages for MilkDrop by '
          
            'editing the milk_msg.ini with Notepad. The problem was that you ' +
            'can'#39't see what you did until '
          'you ran WinAMP, launched MilkDrop and typed your message code.'
          
            'This app gives you an idea how your message will look like WHILE' +
            ' editing it.'
          ''
          
            'The editor should be self-explanatory. I have added "hints" to m' +
            'ost of the controls. Just hold '
          
            'your cursor above a control without moving and the hint-text sho' +
            'uld appear.'
          ''
          
            'The preview is flickering, I know, but hey - this isn'#39't MilkDrop' +
            ' - it'#39's only the message editor!')
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = False
        TabOrder = 0
        WantReturns = False
      end
    end
  end
  object PreTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = PreTimerTimer
    Left = 744
  end
end
