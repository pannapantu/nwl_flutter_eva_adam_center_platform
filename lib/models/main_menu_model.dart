import 'package:flutter/material.dart';
import 'package:widgets_test/models/list_sidebar_menu_model.dart';

class MainMenu {
  final String title;
  final IconData icon;
  bool isFavorite;
  final List<ListSidebarMenu>? listOfSidebarMenu;

  MainMenu(
      {required this.title,
      required this.icon,
      this.listOfSidebarMenu,
      required this.isFavorite});
}
