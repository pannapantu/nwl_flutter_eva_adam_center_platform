import 'package:widgets_test/models/format_message_manage_table_model.dart';

class FormatMessageManageState {
  final List<FormatMessageManageTableModel> listOfFormatMessages;
  final int itemPerPage;
  final int currentPage;
  final bool isLoading;
  final String? error;
  final bool isFormatCreating;
  final int sortedColumnIndex;
  final bool isAscending;

  FormatMessageManageState({
    required this.listOfFormatMessages,
    required this.itemPerPage,
    required this.currentPage,
    required this.isLoading,
    required this.isFormatCreating,
    this.error,
    this.sortedColumnIndex = -1,
    this.isAscending = true,
  });

  FormatMessageManageState copyWith({
    List<FormatMessageManageTableModel>? listOfFormatMessages,
    int? itemPerPage,
    int? currentPage,
    bool? isLoading,
    String? error,
    bool? isFormatCreating,
    int? sortedColumnIndex,
    bool? isAscending,
  }) {
    return FormatMessageManageState(
      listOfFormatMessages: listOfFormatMessages ?? this.listOfFormatMessages,
      itemPerPage: itemPerPage ?? this.itemPerPage,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      isFormatCreating: isFormatCreating ?? this.isFormatCreating,
      sortedColumnIndex: sortedColumnIndex ?? this.sortedColumnIndex,
      isAscending: isAscending ?? this.isAscending,
      error: error ?? this.error,
    );
  }
}
