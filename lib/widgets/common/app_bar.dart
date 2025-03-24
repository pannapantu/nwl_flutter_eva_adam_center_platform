import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/dropdown_menu_user.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/announcement/announcement_viewmodel.dart';
import 'package:widgets_test/viewmodels/app_bar/app_bar_viewmodel.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/models/announcement_model.dart';
import 'package:widgets_test/models/language_model.dart';
import 'package:widgets_test/theme/color.dart';

class AppBarScreen extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarScreen({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    final appBarState = ref.watch(appBarViewModelProvider);
    final mainMenuRefRead = ref.read(mainMenuViewModelProvider.notifier);
    final announcementState = ref.read(announcementViewModelProvider);
    // final mainMenuController = Provider.of<MainMenuController>(context);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.whitePrimary,
      elevation: 4.0,
      shadowColor: AppColor.appBarShadow,
      title: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (routeNow != '/') {
                  mainMenuRefRead.resetMenu(context);
                } else {
                  return;
                }
              },
              child: Image.asset(
                'assets/images/networklink_logo.png',
                width: 74.0,
              ),
            ),
            // Right Side Menu
            Row(
              spacing: 20.0,
              children: [
                Text(
                  appBarState.dateNumber,
                  style: TextStyles.caption,
                ),

                // Notification
                PopupMenuButton(
                  offset: const Offset(0, 24.0),
                  color: AppColor.whitePrimary,
                  itemBuilder: (BuildContext context) {
                    return announcementState.announcements
                        .map((Announcement announcement) {
                      return PopupMenuItem(
                        value: announcement,
                        child: SizedBox(
                          width: 100.0,
                          child: Text(
                            announcement.caption,
                            style: TextStyles.caption,
                            maxLines: 1,
                          ),
                        ),
                      );
                    }).toList();
                  },
                  child: Badge(
                    offset: const Offset(6.0, -4.0),
                    label:
                        Text(announcementState.announcements.length.toString()),
                    child: const Icon(Icons.notifications_none_rounded),
                  ),
                ),

                // Language Dropdown
                DropdownMenu(
                  menuStyle: const MenuStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColor.whitePrimary)),
                  requestFocusOnTap: false,
                  enableSearch: false,
                  width: 110.0,
                  onSelected: (language) {
                    ref
                        .read(appBarViewModelProvider.notifier)
                        .updateLanguage(language as String);
                  },
                  inputDecorationTheme:
                      const InputDecorationTheme(border: InputBorder.none),
                  initialSelection: listLanguage.first,
                  dropdownMenuEntries: listLanguage.map((language) {
                    return DropdownMenuEntry<Language>(
                      value: language,
                      label: language.title,
                      leadingIcon: Image.asset(language.imagePath, width: 22.0),
                    );
                  }).toList(),
                ),

                // User Profile
                PopupMenuButton<String>(
                  offset: const Offset(0, 36.0),
                  color: AppColor.whitePrimary,
                  itemBuilder: (BuildContext context) {
                    return dropdownMenuUser.map((String option) {
                      return PopupMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList();
                  },
                  child: const Chip(
                    color: WidgetStatePropertyAll(Colors.transparent),
                    side: BorderSide(color: Colors.transparent),
                    label:
                        Text("Network Link", overflow: TextOverflow.ellipsis),
                    avatar: CircleAvatar(
                      backgroundColor: AppColor.blackPrimary,
                      child: Text(
                        "N",
                        style: TextStyles.whiteCaption,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
