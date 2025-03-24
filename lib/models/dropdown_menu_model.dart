// dart run build_runner watch --delete-conflicting-outputs

import 'package:json_annotation/json_annotation.dart';

part 'dropdown_menu_model.g.dart';

@JsonSerializable()
class DropdownMenuModel {
  @JsonKey(name: "XVMssCode")
  final String id;
  @JsonKey(name: "label")
  final String label;

  const DropdownMenuModel({required this.id, required this.label});

  factory DropdownMenuModel.fromJson(Map<String, dynamic> json) =>
      _$DropdownMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownMenuModelToJson(this);
}
