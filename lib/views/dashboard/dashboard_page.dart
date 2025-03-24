import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/widgets/common/collapsed_sidebar.dart';
import 'package:widgets_test/widgets/common/sidebar.dart';
import 'package:widgets_test/views/dashboard/dashboard_summary.dart';
import 'package:widgets_test/views/home/home_menu.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenuState = ref.watch(mainMenuViewModelProvider);
    String routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("location: $routeNow");

    return SafeArea(
      child: Row(
        children: [
          if (mainMenuState.selectedListMenu!.isNotEmpty)
            mainMenuState.isSidebarExpanded
                ? const SizedBox(width: 280.0, child: Sidebar())
                : const CollapsedSidebar(),
          Expanded(
            flex: 2,
            child: ListView(children: const [HomeMenu(), DashboardSummary()]),
          ),
        ],
      ),
    );
  }
}
