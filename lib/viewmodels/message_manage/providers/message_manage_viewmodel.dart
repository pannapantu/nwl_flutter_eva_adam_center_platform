import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/message_manage_table_model.dart';
import 'package:widgets_test/services/message_manage/message_manage_service.dart';

import 'package:widgets_test/viewmodels/message_manage/states/message_manage_state.dart';

part "message_manage_viewmodel.g.dart";

@riverpod
class MessageManageViewModel extends _$MessageManageViewModel {
  late final MessageManageService _service;

  @override
  MessageManageState build() {
    _service = MessageManageService();
    Future.microtask(() => fetchMessage());
    return MessageManageState(
        listOfMessages: [],
        itemPerPage: 6,
        currentPage: 0,
        isLoading: false,
        isMessageCreating: false,
        error: null);
  }

  Future<void> fetchMessage() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _service.fetchAllMessageManage();
      final List<dynamic> messageList = response['response'] as List<dynamic>;
      final messages =
          messageList.map((json) => MessageManageTable.fromJson(json)).toList();

      state = state.copyWith(listOfMessages: messages, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> deleteMessageById(String code) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _service.deleteMessageManageById(code);
      final newList = state.listOfMessages
          .where((item) => item.msgId != response['response'])
          .toList();
      state = state.copyWith(
          listOfMessages: newList, isLoading: false, error: null);
      await _service.fetchAllMessageManage();
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void changePage(int newPage) {
    state = state.copyWith(currentPage: newPage);
  }

  void toggleMessageStatus(bool status) {
    state = state.copyWith(isMessageCreating: status);
  }

  void sortColumn(int columnIndex) {
    final List<MessageManageTable> sortedList = List.from(state.listOfMessages);
    bool newColumnIndex =
        state.sortedColumnIndex == columnIndex ? !state.isAscending : true;

    if (columnIndex == 2) {
      sortedList.sort((a, b) => newColumnIndex
          ? a.msgInfoType.compareTo(b.msgInfoType)
          : b.msgInfoType.compareTo(a.msgInfoType));
    } else if (columnIndex == 3) {
      sortedList.sort((a, b) => newColumnIndex
          ? a.msgType.toString().compareTo(b.msgType.toString())
          : b.msgType.toString().compareTo(a.msgType.toString()));
    } else {
      sortedList.sort((a, b) => newColumnIndex
          ? a.msgName.compareTo(b.msgName)
          : b.msgName.compareTo(a.msgName));
    }

    state = state.copyWith(
        listOfMessages: sortedList,
        sortedColumnIndex: columnIndex,
        isAscending: newColumnIndex);
  }

  List<MessageManageTable> getPaginatedMessageManage() {
    int startIndex = state.currentPage * state.itemPerPage;
    int endIndex = startIndex + state.itemPerPage;
    return state.listOfMessages
        .sublist(startIndex, endIndex.clamp(0, state.listOfMessages.length));
  }
}
