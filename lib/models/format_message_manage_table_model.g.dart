// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'format_message_manage_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormatMessageManageTableModel _$FormatMessageManageTableModelFromJson(
        Map<String, dynamic> json) =>
    FormatMessageManageTableModel(
      msfId: json['XVMsfCode'] as String,
      msfName: json['XVMsfName'] as String,
      msfFormat: (json['XVMsfFormat'] as num).toInt(),
      msfType: (json['XVMsfType'] as num).toInt(),
      mssSize: (json['XVMssCode'] as num).toInt(),
      msgCode: json['XVMsgCodeF1'] as String,
      createdDate: DateTime.parse(json['XTWhenCreate'] as String),
      editedDate: DateTime.parse(json['XTWhenEdit'] as String),
      whoCreate: json['XVWhoCreate'] as String,
      whoEdit: json['XVWhoEdit'] as String?,
    );

Map<String, dynamic> _$FormatMessageManageTableModelToJson(
        FormatMessageManageTableModel instance) =>
    <String, dynamic>{
      'XVMsfCode': instance.msfId,
      'XVMsfName': instance.msfName,
      'XVMsfType': instance.msfType,
      'XVMsfFormat': instance.msfFormat,
      'XVMssCode': instance.mssSize,
      'XTWhenCreate': instance.createdDate.toIso8601String(),
      'XTWhenEdit': instance.editedDate.toIso8601String(),
      'XVWhoCreate': instance.whoCreate,
      'XVWhoEdit': instance.whoEdit,
      'XVMsgCodeF1': instance.msgCode,
    };
