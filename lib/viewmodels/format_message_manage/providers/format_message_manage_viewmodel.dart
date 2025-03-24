import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/format_message_manage_table_model.dart';
import 'package:widgets_test/repositories/format_message_manage/format_message_manage_repository.dart';
import 'package:widgets_test/viewmodels/format_message_manage/states/format_message_manage_state.dart';

part 'format_message_manage_viewmodel.g.dart';

@riverpod
class FormatMessageManageViewModel extends _$FormatMessageManageViewModel {
  @override
  FormatMessageManageState build() {
    final repository = ref.read(formatMessageManageRepositoryProvider);
    Future.microtask(() => _fetchFormatMessage(repository));
    return FormatMessageManageState(
      listOfFormatMessages: [],
      itemPerPage: 6,
      currentPage: 0,
      isLoading: false,
      isFormatCreating: false,
      error: null,
      isAscending: true,
      sortedColumnIndex: -1,
    );
  }

  Future<void> _fetchFormatMessage(
      FormatMessageManageRepository repository) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await repository.getAllFormatMessages();
      state = state.copyWith(listOfFormatMessages: result, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void changePage(int newPage) {
    state = state.copyWith(currentPage: newPage);
  }

  void sortColumn(int columnIndex) {
    final List<FormatMessageManageTableModel> sortedList =
        List.from(state.listOfFormatMessages);
    bool newColumnIndex =
        state.sortedColumnIndex == columnIndex ? !state.isAscending : true;

    if (columnIndex == 1) {
      sortedList.sort((a, b) => newColumnIndex
          ? a.msfName.compareTo(b.msfName)
          : b.msfName.compareTo(a.msfName));
    } else if (columnIndex == 2) {
      sortedList.sort((a, b) => newColumnIndex
          ? a.msfType.compareTo(b.msfType)
          : b.msfType.compareTo(a.msfType));
    } else {
      sortedList.sort((a, b) => newColumnIndex
          ? a.createdDate.compareTo(b.createdDate)
          : b.createdDate.compareTo(a.createdDate));
    }

    state = state.copyWith(
        listOfFormatMessages: sortedList,
        sortedColumnIndex: columnIndex,
        isAscending: newColumnIndex);
  }

  List<FormatMessageManageTableModel> getPaginatedMessageManage() {
    int startIndex = state.currentPage * state.itemPerPage;
    int endIndex = startIndex + state.itemPerPage;
    return state.listOfFormatMessages.sublist(
        startIndex, endIndex.clamp(0, state.listOfFormatMessages.length));
  }
}
