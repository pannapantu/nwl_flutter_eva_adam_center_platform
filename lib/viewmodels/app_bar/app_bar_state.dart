class AppBarState {
  final String dateNumber;
  final String selectedLanguage;

  AppBarState(
      {required this.selectedLanguage, required this.dateNumber, required});

  AppBarState copyWith({String? dateNumber, String? selectedLanguage}) {
    return AppBarState(
      dateNumber: dateNumber ?? this.dateNumber,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
