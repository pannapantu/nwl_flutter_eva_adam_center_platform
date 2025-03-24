import 'package:widgets_test/models/list_sidebar_menu_model.dart';
import 'package:widgets_test/models/main_menu_model.dart';

class MainMenuState {
  final bool isSidebarExpanded;
  final List<MainMenu> listOfMenu;
  final String? selectedMainMenu;
  final List<ListSidebarMenu>? selectedListMenu;
  final bool isLoading;
  MainMenuState({
    required this.isSidebarExpanded,
    required this.listOfMenu,
    required this.selectedMainMenu,
    required this.selectedListMenu,
    required this.isLoading,
  });

  MainMenuState copyWith({
    bool? isSidebarExpanded,
    List<MainMenu>? listOfMenu,
    String? selectedMainMenu,
    List<ListSidebarMenu>? selectedListMenu,
    bool? isLoading,
  }) {
    return MainMenuState(
      isSidebarExpanded: isSidebarExpanded ?? this.isSidebarExpanded,
      listOfMenu: listOfMenu ?? this.listOfMenu,
      selectedMainMenu: selectedMainMenu ?? this.selectedMainMenu,
      selectedListMenu: selectedListMenu ?? this.selectedListMenu,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
