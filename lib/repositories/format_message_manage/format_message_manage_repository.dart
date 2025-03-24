import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/format_message_manage_table_model.dart';
import 'package:widgets_test/services/format_message_manage/format_message_manage_service.dart';

part 'format_message_manage_repository.g.dart';

@riverpod
FormatMessageManageRepository formatMessageManageRepository(ref) {
  final service = ref.read(formatMessageManageServiceProvider);
  return FormatMessageManageRepository(service);
}

class FormatMessageManageRepository {
  final FormatMessageManageService service;

  FormatMessageManageRepository(this.service);

  Future<List<FormatMessageManageTableModel>> getAllFormatMessages() async {
    try {
      final jsonData = await service.fetchAllFormatMessage();
      final result = jsonData
          .map((json) => FormatMessageManageTableModel.fromJson(json))
          .toList();
      return result;
    } catch (e) {
      throw Exception("Failed to fetch message $e");
    }
  }
}
