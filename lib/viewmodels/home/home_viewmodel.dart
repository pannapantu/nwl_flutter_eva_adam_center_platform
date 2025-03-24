import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/announcement_model.dart';
import 'package:widgets_test/viewmodels/announcement/announcement_viewmodel.dart';
import 'package:widgets_test/viewmodels/home/home_state.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() {
    return HomeState(itemPerPage: 6, currentPage: 0);
  }

  List<Announcement> getPaginatedNews() {
    final announcementState = ref.watch(announcementViewModelProvider);
    final announcements = announcementState.announcements;

    int startIndex = state.currentPage * state.itemPerPage;
    int endIndex =
        (startIndex + state.itemPerPage).clamp(0, announcements.length);

    return announcements.sublist(startIndex, endIndex);
  }

  void changePage(int newPage) {
    state = state.copyWith(currentPage: newPage);
  }
}
