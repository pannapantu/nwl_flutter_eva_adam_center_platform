import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_test/models/list_sidebar_menu_model.dart';
import 'package:widgets_test/models/main_menu_model.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_state.dart';

part 'main_menu_viewmodel.g.dart';

@riverpod
class MainMenuViewModel extends _$MainMenuViewModel {
  @override
  MainMenuState build() {
    _loadPersistedMenu();
    return MainMenuState(
        isLoading: true,
        isSidebarExpanded: false,
        listOfMenu: listMenu,
        selectedMainMenu: '',
        selectedListMenu: []);
  }

  void setSidebarStatus() {
    state = state.copyWith(isSidebarExpanded: !state.isSidebarExpanded);
  }

  Future<void> saveSelectedListMenu(List<ListSidebarMenu> menuList) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final encodedList =
          menuList.map((item) => jsonEncode(item.toJson())).toList();
      prefs.setStringList("selectedListMenu", encodedList);
    } catch (e) {
      throw Exception("Error from loading ListMenu : $e");
    }
  }

  Future<List<ListSidebarMenu>> loadSelectedListMenu() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final encodedList = prefs.getStringList("selectedListMenu") ?? [];
      return encodedList
          .map((item) => ListSidebarMenu.fromJson(jsonDecode(item)))
          .toList();
    } catch (e) {
      throw Exception("Error from loading ListMenu : $e");
    }
  }

  Future<void> _loadPersistedMenu() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      state = state.copyWith(isLoading: true);
      final selectedMainMenu = prefs.getString("selectedMainMenu") ?? '';
      final selectedListMenu = await loadSelectedListMenu();
      state = state.copyWith(
          selectedMainMenu: selectedMainMenu,
          selectedListMenu: selectedListMenu);
    } catch (e) {
      state = state.copyWith(isLoading: false);
      throw Exception("Error from loading ListMenu : $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> selectNewMenu(
      String newMainMenu, newListMenu, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    if (state.selectedMainMenu != newMainMenu &&
        state.selectedListMenu != newListMenu) {
      await prefs.setString('selectedMainMenu', newMainMenu);
      await saveSelectedListMenu(newListMenu);
      state = state.copyWith(
        selectedMainMenu: newMainMenu,
        selectedListMenu: newListMenu,
      );
    } else {
      await prefs.remove('selectedMainMenu');
      await prefs.remove('selectedListMenu');
      state = state.copyWith(
        selectedMainMenu: '',
        selectedListMenu: [],
      );
      context.go("/");
    }
  }

  Future<void> resetMenu(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (state.selectedListMenu != null && state.selectedMainMenu != null) {
      state = state.copyWith(selectedListMenu: [], selectedMainMenu: '');
      await prefs.remove('selectedMainMenu');
      await prefs.remove('selectedListMenu');
      context.pop();
    }
  }

  List<MainMenu> listMenu = [
    MainMenu(
        title: "ป้ายประชาสัมพันธ์",
        icon: Icons.announcement_rounded,
        isFavorite: false,
        listOfSidebarMenu: [
          ListSidebarMenu(
              title: "ป้ายประชาสัมพันธ์",
              icon: Icons.panorama_wide_angle_rounded,
              submenu: [
                ListSidebarMenu(title: "ที่ตั้งอุปกรณ์", submenu: [
                  ListSidebarMenu(title: "ทช.ระยอง", submenu: [
                    ListSidebarMenu(title: "มานตาพุต", submenu: [
                      ListSidebarMenu(title: "จุดที่ 1", submenu: [
                        ListSidebarMenu(
                          title: "VMS1 (PR)",
                        ),
                        ListSidebarMenu(
                          title: "VMS2 (PR)",
                        ),
                        ListSidebarMenu(
                          title: "VMS3 (PR)",
                        ),
                      ]),
                      ListSidebarMenu(
                        title: "จุดที่ 2",
                      ),
                      ListSidebarMenu(
                        title: "จุดที่ 3",
                      ),
                      ListSidebarMenu(
                        title: "จุดที่ 4",
                      ),
                    ]),
                    ListSidebarMenu(
                      title: "แม่รำพึง",
                    ),
                  ]),
                  ListSidebarMenu(
                    title: "ทช. เชียงใหม่",
                  ),
                  ListSidebarMenu(
                    title: "อบจ. ราชบุรี",
                  ),
                ]),
              ],
              route: ""),
          ListSidebarMenu(
              title: "จัดการป้ายประชาสัมพันธ์",
              icon: Icons.settings,
              submenu: [
                ListSidebarMenu(title: "ข้อความ", route: "message_manage"),
                ListSidebarMenu(
                    title: "ชุดข้อความ", route: "format_message_manage"),
                ListSidebarMenu(
                  title: "รูปแบบหน้าจอ",
                ),
              ]),
          ListSidebarMenu(
              title: "รายงาน", route: "report", icon: Icons.insert_drive_file),
          ListSidebarMenu(
              title: "แดชบอร์ด", route: "dashboard", icon: Icons.timeline),
          ListSidebarMenu(
              title: "แผนที่",
              route: "map",
              icon: Icons.map,
              submenu: [
                ListSidebarMenu(title: "ที่ตั้งอุปกรณ์", submenu: [
                  ListSidebarMenu(title: "ทช.ระยอง", submenu: [
                    ListSidebarMenu(title: "มานตาพุต", submenu: [
                      ListSidebarMenu(
                        title: "จุดที่ 1",
                      ),
                      ListSidebarMenu(
                        title: "จุดที่ 2",
                      ),
                      ListSidebarMenu(
                        title: "จุดที่ 3",
                      ),
                    ]),
                    ListSidebarMenu(
                      title: "แม่รำพึง",
                    ),
                  ]),
                  ListSidebarMenu(
                    title: "ทช. เชียงใหม่",
                  ),
                  ListSidebarMenu(
                    title: "อบจ. ราชบุรี",
                  ),
                ]),
              ]),
        ]),
    MainMenu(
        title: "ป้ายข้อความกำกับช่องทางเดินรถ",
        icon: Icons.streetview_rounded,
        isFavorite: false,
        listOfSidebarMenu: [ListSidebarMenu(title: "Test1")]),
    MainMenu(
        title: "ไฟชี้ช่องทาง",
        icon: Icons.upgrade_rounded,
        isFavorite: false,
        listOfSidebarMenu: [ListSidebarMenu(title: "Test1")]),
    MainMenu(
      title: "ตรวจจับความเร็ว",
      icon: Icons.speed_rounded,
      isFavorite: false,
    ),
    MainMenu(
      title: "ตรวจสอบความหนาแน่นรถ",
      icon: Icons.car_crash_rounded,
      isFavorite: false,
    ),
    MainMenu(
      title: "นับยานพาหนะ",
      icon: Icons.confirmation_number_rounded,
      isFavorite: false,
    ),
    MainMenu(
      title: "โคมอัจฉริยะ",
      icon: Icons.lightbulb_circle_rounded,
      isFavorite: false,
    ),
    MainMenu(
      title: "ชุดตรวจสอบความปลอดภัย",
      icon: Icons.videocam,
      isFavorite: false,
    ),
    MainMenu(
      title: "ตรวจวัดน้ำหนักรถ",
      icon: Icons.line_weight_rounded,
      isFavorite: false,
    ),
  ];

  bool isRouteMatch(ListSidebarMenu item, String routeNow) {
    // Check item's own route
    if (item.route != null && "/${item.route}" == routeNow) {
      return true;
    }

    // Check submenu routes recursively
    if (item.submenu != null) {
      return item.submenu!.any((submenu) => isRouteMatch(submenu, routeNow));
    }

    return false;
  }
}
