class Language {
  final String title;
  final String imagePath;

  Language({required this.title, required this.imagePath});
}

List<Language> listLanguage = [
  Language(title: "Thai", imagePath: 'assets/icons/thailand_flag.png'),
  Language(title: "English", imagePath: 'assets/icons/uk_flag.png'),
];