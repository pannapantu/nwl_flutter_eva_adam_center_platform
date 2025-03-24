import 'package:flutter/material.dart';

class ListSidebarMenu {
  final String title;
  final IconData? icon;
  final String? route;
  List<ListSidebarMenu>? submenu;

  ListSidebarMenu({this.route, required this.title, this.icon, this.submenu});

  factory ListSidebarMenu.fromJson(Map<String, dynamic> json) {
    return ListSidebarMenu(
      title: json['title'],
      icon: json['iconCodePoint'] != null
          ? IconData(json['iconCodePoint'], fontFamily: 'MaterialIcons')
          : null,
      route: json['route'],
      submenu: json['submenu'] != null
          ? (json['submenu'] as List)
              .map((item) => ListSidebarMenu.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'iconCodePoint': icon?.codePoint,
      'route': route,
      'submenu': submenu?.map((item) => item.toJson()).toList(),
    };
  }
}
