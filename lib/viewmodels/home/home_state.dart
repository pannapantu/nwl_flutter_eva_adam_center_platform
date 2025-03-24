class HomeState {
  final int itemPerPage;
  final int currentPage;
  HomeState({required this.itemPerPage, required this.currentPage});

  HomeState copyWith({
    int? itemPerPage,
    int? currentPage,
  }) {
    return HomeState(
        itemPerPage: itemPerPage ?? this.itemPerPage,
        currentPage: currentPage ?? this.currentPage);
  }
}
