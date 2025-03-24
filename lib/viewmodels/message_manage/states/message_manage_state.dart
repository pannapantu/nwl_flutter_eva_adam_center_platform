import 'package:widgets_test/models/message_manage_table_model.dart';

class MessageManageState {
  final List<MessageManageTable> listOfMessages;
  final int itemPerPage;
  final int currentPage;
  final bool isLoading;
  final String? error;
  final bool isMessageCreating;
  final int sortedColumnIndex;
  final bool isAscending;

  MessageManageState({
    required this.listOfMessages,
    required this.itemPerPage,
    required this.currentPage,
    this.isMessageCreating = false,
    this.isLoading = false,
    this.error,
    this.sortedColumnIndex = -1,
    this.isAscending = true,
  });

  MessageManageState copyWith({
    int? itemPerPage,
    int? currentPage,
    List<MessageManageTable>? listOfMessages,
    bool? isLoading,
    String? error,
    bool? isMessageCreating,
    int? sortedColumnIndex,
    bool? isAscending,
  }) {
    return MessageManageState(
      listOfMessages: listOfMessages ?? this.listOfMessages,
      itemPerPage: itemPerPage ?? this.itemPerPage,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      isMessageCreating: isMessageCreating ?? this.isMessageCreating,
      error: error ?? this.error,
      sortedColumnIndex: sortedColumnIndex ?? this.sortedColumnIndex,
      isAscending: isAscending ?? this.isAscending,
    );
  }
}
