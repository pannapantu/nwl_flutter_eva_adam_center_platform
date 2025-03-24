import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/widgets/common/collapsed_sidebar.dart';
import 'package:widgets_test/views/home/home_menu.dart';
import 'package:widgets_test/views/home/home_news_list.dart';
import 'package:widgets_test/widgets/common/loading.dart';
import 'package:widgets_test/widgets/common/sidebar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainMenuState = ref.watch(mainMenuViewModelProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    // Check Route
    String routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    print("location: $routeNow");

    if (mainMenuState.isLoading) {
      return const Center(
        child: Loading(),
      );
    }

    return SafeArea(
      child: Flex(
        spacing: 10.0,
        direction: Axis.horizontal,
        children: [
          if (mainMenuState.selectedListMenu!.isNotEmpty)
            mainMenuState.isSidebarExpanded
      ? const SizedBox(width: 280.0, child: Sidebar())
                : const CollapsedSidebar(),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: screenWidth,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  HomeMenu(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: HomeNewsList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
