import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_manage_table_model.g.dart';

@JsonSerializable()
class MessageManageTableResponse {
  @JsonKey(name: 'response')
  final List<MessageManageTable> messages;

  MessageManageTableResponse({required this.messages});

  factory MessageManageTableResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageManageTableResponseFromJson(json);
}

class MessageType {
  static const int text = 1;
  static const int picture = 2;
  static const int video = 3;

  static String getTitle(int type) {
    switch (type) {
      case 1:
        return "ตัวอักษร";
      case 2:
        return "รูปภาพ";
      case 3:
        return "วิดิโอ";
      default:
        return "";
    }
  }

  static IconData getIcon(int type) {
    switch (type) {
      case 1:
        return Icons.image;
      case 2:
        return Icons.title;
      case 3:
        return Icons.videocam;
      default:
        return Icons.error;
    }
  }
}

class MessageInfoType {
  static const int information = 1;
  static const int traffic = 2;

  static String getTitle(int purpose) {
    switch (purpose) {
      case 1:
        return "ประชาสัมพันธ์";
      case 2:
        return "สภาพจราจร";

      default:
        return "";
    }
  }
}

class IsActive {
  static const int inactive = 0;
  static const int active = 1;

  static String getTitle(int status) {
    switch (status) {
      case 0:
        return "Inactive";
      case 1:
        return "Active";

      default:
        return "";
    }
  }
}

@JsonSerializable()
class MessageManageTable {
  @JsonKey(name: 'XVMsgCode')
  final String msgId;

  @JsonKey(name: 'XVMsgName')
  final String msgName;

  @JsonKey(name: "XVMsgHtml")
  final String msgHtml;

  @JsonKey(name: "XVMsgHtmlM")
  final String? msgHtmlM;

  @JsonKey(name: 'XVMsgType')
  final int msgType;

  @JsonKey(name: 'XVMsgInfoType')
  final int msgInfoType;

  @JsonKey(name: 'XTWhenCreate')
  final DateTime date;

  @JsonKey(name: 'XVMsgStatus')
  final int isActive;

  const MessageManageTable({
    required this.msgInfoType,
    required this.msgType,
    required this.msgName,
    required this.msgId,
    required this.date,
    required this.isActive,
    required this.msgHtml,
    this.msgHtmlM,
  });

  factory MessageManageTable.fromJson(Map<String, dynamic> json) =>
      _$MessageManageTableFromJson(json);

  Map<String, dynamic> toJson() => _$MessageManageTableToJson(this);
}
