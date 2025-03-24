import 'package:json_annotation/json_annotation.dart';
// import 'package:widgets_test/models/message_manage_table_model.dart';

part 'format_message_manage_table_model.g.dart';

// msfType
class FormatMessageType {
  static const int information = 1;
  static const int traffic = 2;

  static String getTitle(int type) {
    switch (type) {
      case 1:
        return "ประชาสัมพันธ์";
      case 2:
        return "สภาพจราจร";
      default:
        return "";
    }
  }
}

// msfFormat
class FormatMessageTemplate {
  static const int firstTemplate = 1;
  static const int secondTemplate = 2;
  static const int thirdTemplate = 3;

  static String getTitle(int template) {
    switch (template) {
      case 1:
        return "แบบข้อความเดี่ยว";
      case 2:
        return "แบบ 2 ข้อความ 3 ช่อง";
      case 3:
        return "แบบ 1 ข้อความ 2 ช่อง";
      default:
        return "";
    }
  }
}

class MessageSignSize {
  static const int firstSize = 1;
  static const int secondSize = 2;
  static const int thirdSize = 3;
  static const int fourthSize = 4;
  static const int fifthSize = 5;
  static const int sixthSize = 6;

  static String getSize(int size) {
    switch (size) {
      case 1:
        return "960x384 PX";
      case 2:
        return "960x100 PX";
      case 3:
        return "344x178 PX";
      case 4:
        return "960x76 PX";
      case 5:
        return "640x320 PX";
      case 6:
        return "960x384 PX";
      default:
        return "";
    }
  }
}

@JsonSerializable()
class FormatMessageManageTableModel {
  @JsonKey(name: "XVMsfCode")
  final String msfId;

  @JsonKey(name: "XVMsfName")
  final String msfName;

  @JsonKey(name: "XVMsfType")
  final int msfType; // (1: ประชาสัมพันธ์,2: สภาพจราจร)

  @JsonKey(name: "XVMsfFormat")
  final int
      msfFormat; // (1: แบบข้อความเดี่ยว, 2: แบบ 2 ข้อความ 3 ช่อง, 3: แบบ 1 ข้อความ 2 ช่อง)

  @JsonKey(name: 'XVMssCode')
  final int mssSize;

  @JsonKey(name: 'XTWhenCreate')
  final DateTime createdDate;

  @JsonKey(name: 'XTWhenEdit')
  final DateTime editedDate;

  @JsonKey(name: 'XVWhoCreate')
  final String whoCreate;

  @JsonKey(name: 'XVWhoEdit')
  final String? whoEdit;

  @JsonKey(name: 'XVMsgCodeF1')
  final String msgCode;

  const FormatMessageManageTableModel({
    required this.msfId,
    required this.msfName,
    required this.msfFormat,
    required this.msfType,
    required this.mssSize,
    required this.msgCode,
    required this.createdDate,
    required this.editedDate,
    required this.whoCreate,
    this.whoEdit,
  });

  factory FormatMessageManageTableModel.fromJson(Map<String, dynamic> json) =>
      _$FormatMessageManageTableModelFromJson(json);

  Map<String, dynamic> toJson() => _$FormatMessageManageTableModelToJson(this);
}
