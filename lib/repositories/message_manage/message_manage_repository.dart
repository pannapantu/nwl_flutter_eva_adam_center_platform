import 'package:widgets_test/models/message_manage_table_model.dart';
import 'package:widgets_test/services/message_manage/message_manage_service.dart';

class MessageManageRepository {
  final MessageManageService service;

  MessageManageRepository(this.service);

  Future<List<MessageManageTable>> getAllMessages() async {
    final jsonData = await service.fetchAllMessageManage();
    final List<dynamic> messageData = jsonData['response'];
    return messageData
        .map((json) => MessageManageTable.fromJson(json))
        .toList();
  }

  Future<Map<String, dynamic>> deleteMessage(String msgCode) async {
    try {
      return await service.deleteMessageManageById(msgCode);
    } catch (e) {
      throw Exception("Error in repository while deleting message: $e");
    }
  }
}
