import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/views/format_message_manage/format_message_manage_data.dart';
import 'package:widgets_test/views/home/home_menu.dart';
import 'package:widgets_test/widgets/common/collapsed_sidebar.dart';
import 'package:widgets_test/widgets/common/sidebar.dart';

class FormatMessageManagePage extends ConsumerWidget {
  const FormatMessageManagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenuState = ref.watch(mainMenuViewModelProvider);

    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (mainMenuState.selectedListMenu!.isNotEmpty)
            mainMenuState.isSidebarExpanded
                ? const SizedBox(width: 280.0, child: Sidebar())
                : const CollapsedSidebar(),
          Expanded(
              flex: 2,
              child: ListView(
                shrinkWrap: true,
                children: const [
                  HomeMenu(),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: FormatMessageManageData())
                ],
              ))
        ],
      ),
    );
  }
}
