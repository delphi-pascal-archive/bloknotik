object fmSearch: TfmSearch
  Left = 0
  Top = 0
  Caption = 'fmSearch'
  ClientHeight = 411
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pFilters: TPanel
    Left = 0
    Top = 0
    Width = 736
    Height = 343
    Align = alTop
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 0
    Visible = False
    object gbGeneralFilters: TGroupBox
      Left = 0
      Top = 26
      Width = 736
      Height = 120
      Align = alTop
      Caption = #1054#1073#1097#1080#1077' '#1092#1080#1083#1100#1090#1088#1099
      TabOrder = 0
      DesignSize = (
        736
        120)
      object Bevel1: TBevel
        Left = 5
        Top = 13
        Width = 726
        Height = 75
        Anchors = [akLeft, akTop, akRight]
        Style = bsRaised
        ExplicitWidth = 720
      end
      object lbFio: TLabel
        Left = 11
        Top = 15
        Width = 42
        Height = 13
        Caption = #1060'.'#1048'.'#1054'. :'
      end
      object lbDate: TLabel
        Left = 496
        Top = 15
        Width = 84
        Height = 13
        Caption = #1044#1072#1090#1072' '#1056#1086#1078#1076#1077#1085#1080#1103':'
      end
      object lbd1: TLabel
        Left = 483
        Top = 66
        Width = 7
        Height = 13
        Caption = 'C'
        Enabled = False
      end
      object lbFor: TLabel
        Left = 599
        Top = 66
        Width = 12
        Height = 13
        Caption = #1087#1086
        Enabled = False
      end
      object cbMan: TCheckBox
        Left = 11
        Top = 67
        Width = 97
        Height = 17
        Caption = #1063#1077#1083#1086#1074#1077#1082
        TabOrder = 0
      end
      object eFIOFilter: TEdit
        Left = 11
        Top = 34
        Width = 302
        Height = 21
        TabOrder = 1
        Text = 'eFIOFilter'
      end
      object cbOnlyWithFoto: TCheckBox
        Left = 123
        Top = 67
        Width = 97
        Height = 17
        Caption = #1058#1086#1083#1100#1082#1086' '#1089' '#1092#1086#1090#1086
        TabOrder = 2
      end
      object rbDateOne: TRadioButton
        Left = 333
        Top = 36
        Width = 143
        Height = 17
        Alignment = taLeftJustify
        Caption = #1058#1086#1095#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
        Checked = True
        TabOrder = 3
        TabStop = True
      end
      object rbDateBeetwen: TRadioButton
        Left = 333
        Top = 65
        Width = 143
        Height = 17
        Alignment = taLeftJustify
        Caption = #1044#1080#1072#1087#1072#1079#1086#1085
        TabOrder = 4
      end
      object btnGStopF: TBitBtn
        Left = 135
        Top = 91
        Width = 118
        Height = 24
        Anchors = [akLeft, akBottom]
        Caption = #1041#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        DoubleBuffered = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8751734328853030AD2D2DAC5656
          BAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF75
          59830D0D9A1717C83535E43838E61F1FCF1414A9FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFAC70772E38B24948D97676FE1414FF0E0EFF6A6A
          FF6A6AE80E0EA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA6C7401
          01C13435FFC9C9FE6464FE4E4EFED1D1FE5757FF0000CE5B5BBCFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFAA6C741B1BD63939FF8282FEE7E7FEEEEEFF9D9D
          FE4040FF2121E53030AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5736B41
          42D57070FF9C9CFEEAEAFEEEEEFFAAAAFE7373FF5050E53232AFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFBD846B242AC38181FDE1E1FF8D8DFE7777FEDBDB
          FF9898FF2626CB6262BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6946B74
          76C3534ED27777FF3232FF2D2DFF6666FF6C6CE31818A9FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC28466EFEFEFCDC4C83141A40505C00E0BDC1010E10909
          C91717AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF8060EFEFEFCECED6BD
          BDBD878C914659821C39933629957474C5FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFBF7E5EEFEFEFEFEFEFC6C6C6ADADAD8C8C8C737373585A5D414143B279
          80FF00FFFF00FFFF00FFFF00FFFF00FFBE7D5CEFEFEFEFEFEFCECED6BDBDBD9C
          9C9C8484848484847373735A5A5A424242AD7279FF00FFFF00FFFF00FFBD7B5A
          EFEFEFEFEFEFCECED6C6C6C6C6C6C68484848484848484848484847373735A5A
          5A424242A96A72FF00FFD6946BD6946BD6946BD6946BD6946BD6946BD6946BD6
          946BD6946BD6946BD6946BD6946BD6946BD6946BD6946BD7976EFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentDoubleBuffered = False
        TabOrder = 5
      end
      object btnGStartF: TBitBtn
        Left = 11
        Top = 91
        Width = 118
        Height = 24
        Anchors = [akLeft, akBottom]
        Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B00000001000000000000104A10001063
          100010731000108410001094100039AD520031BD520039BD5A0042CE5A0039BD
          63004AD663004AD6730052DE730052E77B0063EF840063EF8C006BEF8C006BEF
          940084F7A500C0C0C00000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000131313131313
          1313020213131313131313131313131313030902131313131313131313131313
          030D090213131313131313131313131303120902131313131313131313131313
          0312090213131313131313131313131303120902131313131313131313131313
          0312090213131313131313131313131303120902131313131313131313131303
          120D09000213131313131313131303120D0D0501000213131313131313031210
          0E0D070401000213131313130312110F0D0B0909040100021313130312110C0A
          0806090909040100021303030303030303030303030303030303131313131313
          1313131313131313131313131313131313131313131313131313}
        ParentDoubleBuffered = False
        TabOrder = 6
      end
      object dtpOneDate: TDBDateTimeEditEh
        Left = 496
        Top = 34
        Width = 97
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 7
        Visible = True
      end
      object dtpDateb1: TDBDateTimeEditEh
        Left = 496
        Top = 61
        Width = 97
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 8
        Visible = True
      end
      object dtpDateb2: TDBDateTimeEditEh
        Left = 617
        Top = 61
        Width = 97
        Height = 21
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 9
        Visible = True
      end
    end
    object gbAdditionalFilters: TGroupBox
      Left = 0
      Top = 146
      Width = 736
      Height = 145
      Align = alTop
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1092#1080#1083#1100#1090#1088#1099
      TabOrder = 1
      DesignSize = (
        736
        145)
      object Bevel2: TBevel
        Left = 5
        Top = 15
        Width = 726
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Style = bsRaised
        ExplicitWidth = 720
      end
      object lbDataType: TLabel
        Left = 11
        Top = 16
        Width = 78
        Height = 13
        Caption = #1058#1080#1087' '#1088#1077#1082#1074#1080#1079#1080#1090#1072':'
      end
      object lbDataVal: TLabel
        Left = 320
        Top = 16
        Width = 96
        Height = 13
        Caption = #1048#1089#1082#1086#1084#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077':'
      end
      object lbReminderVal: TLabel
        Left = 320
        Top = 62
        Width = 110
        Height = 13
        Caption = #1057#1090#1088#1086#1082#1072' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103':'
      end
      object lbEventVal: TLabel
        Left = 11
        Top = 62
        Width = 87
        Height = 13
        Caption = #1057#1090#1088#1086#1082#1072' '#1089#1086#1073#1099#1090#1080#1103':'
      end
      object dbluDataType: TDBLookupComboBox
        Left = 11
        Top = 35
        Width = 288
        Height = 21
        NullValueKey = 46
        TabOrder = 0
      end
      object eDataVal: TEdit
        Left = 320
        Top = 35
        Width = 288
        Height = 21
        TabOrder = 1
        Text = 'eDataVal'
      end
      object eReminderStr: TEdit
        Left = 320
        Top = 81
        Width = 288
        Height = 21
        TabOrder = 2
        Text = 'eReminderStr'
      end
      object eEventStr: TEdit
        Left = 11
        Top = 81
        Width = 288
        Height = 21
        TabOrder = 3
        Text = 'eEventStr'
      end
      object btnAStopF: TBitBtn
        Left = 135
        Top = 116
        Width = 118
        Height = 24
        Anchors = [akLeft, akBottom]
        Caption = #1041#1077#1079' '#1092#1080#1083#1100#1090#1088#1072
        DoubleBuffered = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8751734328853030AD2D2DAC5656
          BAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF75
          59830D0D9A1717C83535E43838E61F1FCF1414A9FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFAC70772E38B24948D97676FE1414FF0E0EFF6A6A
          FF6A6AE80E0EA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAA6C7401
          01C13435FFC9C9FE6464FE4E4EFED1D1FE5757FF0000CE5B5BBCFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFAA6C741B1BD63939FF8282FEE7E7FEEEEEFF9D9D
          FE4040FF2121E53030AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA5736B41
          42D57070FF9C9CFEEAEAFEEEEEFFAAAAFE7373FF5050E53232AFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFBD846B242AC38181FDE1E1FF8D8DFE7777FEDBDB
          FF9898FF2626CB6262BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6946B74
          76C3534ED27777FF3232FF2D2DFF6666FF6C6CE31818A9FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC28466EFEFEFCDC4C83141A40505C00E0BDC1010E10909
          C91717AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF8060EFEFEFCECED6BD
          BDBD878C914659821C39933629957474C5FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFBF7E5EEFEFEFEFEFEFC6C6C6ADADAD8C8C8C737373585A5D414143B279
          80FF00FFFF00FFFF00FFFF00FFFF00FFBE7D5CEFEFEFEFEFEFCECED6BDBDBD9C
          9C9C8484848484847373735A5A5A424242AD7279FF00FFFF00FFFF00FFBD7B5A
          EFEFEFEFEFEFCECED6C6C6C6C6C6C68484848484848484848484847373735A5A
          5A424242A96A72FF00FFD6946BD6946BD6946BD6946BD6946BD6946BD6946BD6
          946BD6946BD6946BD6946BD6946BD6946BD6946BD6946BD7976EFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentDoubleBuffered = False
        TabOrder = 4
      end
      object btnAStartF: TBitBtn
        Left = 11
        Top = 116
        Width = 118
        Height = 24
        Anchors = [akLeft, akBottom]
        Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
        DoubleBuffered = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B00000001000000000000104A10001063
          100010731000108410001094100039AD520031BD520039BD5A0042CE5A0039BD
          63004AD663004AD6730052DE730052E77B0063EF840063EF8C006BEF8C006BEF
          940084F7A500C0C0C00000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000131313131313
          1313020213131313131313131313131313030902131313131313131313131313
          030D090213131313131313131313131303120902131313131313131313131313
          0312090213131313131313131313131303120902131313131313131313131313
          0312090213131313131313131313131303120902131313131313131313131303
          120D09000213131313131313131303120D0D0501000213131313131313031210
          0E0D070401000213131313130312110F0D0B0909040100021313130312110C0A
          0806090909040100021303030303030303030303030303030303131313131313
          1313131313131313131313131313131313131313131313131313}
        ParentDoubleBuffered = False
        TabOrder = 5
      end
    end
    object pFilterChecks: TPanel
      Left = 0
      Top = 0
      Width = 736
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object cbGeneralF: TCheckBox
        Left = 169
        Top = 5
        Width = 129
        Height = 17
        Caption = #1054#1073#1097#1080#1077' '#1092#1080#1083#1100#1090#1088#1099
        TabOrder = 0
      end
      object cbAdditionalF: TCheckBox
        Left = 304
        Top = 6
        Width = 167
        Height = 17
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1092#1080#1083#1100#1090#1088#1099
        TabOrder = 1
      end
      object cbCategoryFilters: TCheckBox
        Left = 11
        Top = 6
        Width = 152
        Height = 17
        Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object gbCategory: TGroupBox
      Left = 0
      Top = 291
      Width = 736
      Height = 49
      Align = alTop
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
      TabOrder = 3
    end
  end
end
