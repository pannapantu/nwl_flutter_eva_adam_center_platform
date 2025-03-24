import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/dropdown_menu_model.dart';
import 'package:widgets_test/services/message_manage/dropdown_menu_service.dart';
import 'package:widgets_test/viewmodels/message_manage/states/message_size_dropdown_state.dart';

part 'message_size_dropdown_viewmodel.g.dart';

@riverpod
class MessageSizeDropdownViewModel extends _$MessageSizeDropdownViewModel {
  late final DropdownMenuService _service;

  @override
  MessageSizeDropdownState build() {
    _service = DropdownMenuService();
    Future.microtask(() => fetchMessageSize());
    return MessageSizeDropdownState(
        listOfMessageSize: [], isLoading: true, error: null);
  }

  Future<void> fetchMessageSize() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _service.fetchMessageSize();
      final options =
          response.map((json) => DropdownMenuModel.fromJson(json)).toList();
      state = state.copyWith(
          isLoading: false, error: null, listOfMessageSize: options);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
