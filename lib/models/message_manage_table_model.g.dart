// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_manage_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageManageTableResponse _$MessageManageTableResponseFromJson(
        Map<String, dynamic> json) =>
    MessageManageTableResponse(
      messages: (json['response'] as List<dynamic>)
          .map((e) => MessageManageTable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MessageManageTable _$MessageManageTableFromJson(Map<String, dynamic> json) =>
    MessageManageTable(
      msgInfoType: (json['XVMsgInfoType'] as num).toInt(),
      msgType: (json['XVMsgType'] as num).toInt(),
      msgName: json['XVMsgName'] as String,
      msgId: json['XVMsgCode'] as String,
      date: DateTime.parse(json['XTWhenCreate'] as String),
      isActive: (json['XVMsgStatus'] as num).toInt(),
      msgHtml: json['XVMsgHtml'] as String,
      msgHtmlM: json['XVMsgHtmlM'] as String?,
    );

Map<String, dynamic> _$MessageManageTableToJson(MessageManageTable instance) =>
    <String, dynamic>{
      'XVMsgCode': instance.msgId,
      'XVMsgName': instance.msgName,
      'XVMsgHtml': instance.msgHtml,
      'XVMsgHtmlM': instance.msgHtmlM,
      'XVMsgType': instance.msgType,
      'XVMsgInfoType': instance.msgInfoType,
      'XTWhenCreate': instance.date.toIso8601String(),
      'XVMsgStatus': instance.isActive,
    };
