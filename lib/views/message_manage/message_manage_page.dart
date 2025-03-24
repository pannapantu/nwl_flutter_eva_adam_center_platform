import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/viewmodels/message_manage/providers/message_manage_viewmodel.dart';
import 'package:widgets_test/views/home/home_menu.dart';
import 'package:widgets_test/views/message_manage/message_manage_data.dart';
import 'package:widgets_test/views/message_manage/message_manage_form.dart';
import 'package:widgets_test/widgets/common/collapsed_sidebar.dart';
import 'package:widgets_test/widgets/common/sidebar.dart';

class MessageManagementPage extends ConsumerWidget {
  const MessageManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenuState = ref.watch(mainMenuViewModelProvider);
    final messageManageState = ref.watch(messageManageViewModelProvider);
    String routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("location: $routeNow");

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
                children: [
                  const HomeMenu(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: messageManageState.isMessageCreating
                        ? const MessageManageForm()
                        : const MessageManageData(),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
