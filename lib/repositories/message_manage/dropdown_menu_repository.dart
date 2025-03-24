import 'package:widgets_test/models/dropdown_menu_model.dart';
import 'package:widgets_test/services/message_manage/dropdown_menu_service.dart';

class DropdownMenuRepository {
  final DropdownMenuService service;

  DropdownMenuRepository({required this.service});

  Future<List<DropdownMenuModel>> getMessageSize() async {
    final jsonData = await service.fetchMessageSize();
    final List<dynamic> options = jsonData;
    return options.map((json) => DropdownMenuModel.fromJson(json)).toList();
  }
}
