import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';

import 'package:widgets_test/theme/color.dart';

class CollapsedSidebar extends ConsumerStatefulWidget {
  const CollapsedSidebar({super.key});

  @override
  ConsumerState<CollapsedSidebar> createState() => _CollapsedSidebarState();
}

class _CollapsedSidebarState extends ConsumerState<CollapsedSidebar> {
  final Map<String, bool> _isListHovered = {};

  @override
  Widget build(BuildContext context) {
    final routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();
    final mainMenuState = ref.watch(mainMenuViewModelProvider);
    return Drawer(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        width: 64,
        backgroundColor: AppColor.blackAlpha45Primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Column(children: [
            IconButton(
              color: AppColor.blackPrimary,
              onPressed:
                  ref.read(mainMenuViewModelProvider.notifier).setSidebarStatus,
              icon: const Icon(
                Icons.open_in_full_rounded,
                size: 24.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ...?mainMenuState.selectedListMenu?.map((item) {
              return Tooltip(
                verticalOffset: 10.0,
                margin: const EdgeInsets.only(left: 40.0),
                showDuration: const Duration(milliseconds: 300),
                message: item.title,
                child: InkWell(
                  onTap: () {
                    item.route != null
                        ? context.go("/${item.route}")
                        : ref
                            .read(mainMenuViewModelProvider.notifier)
                            .setSidebarStatus();
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) {
                      setState(() {
                        _isListHovered[item.title] = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _isListHovered[item.title] = false;
                      });
                    },
                    child: Container(
                      color: ref
                              .read(mainMenuViewModelProvider.notifier)
                              .isRouteMatch(item, routeNow)
                          ? AppColor.redColor
                          : _isListHovered[item.title] == true
                              ? AppColor.redColor.withValues(alpha: 0.3)
                              : Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Icon(item.icon,
                          size: 24.0,
                          color: ref
                                  .read(mainMenuViewModelProvider.notifier)
                                  .isRouteMatch(item, routeNow)
                              ? AppColor.whitePrimary
                              : _isListHovered[item.title] == true
                                  ? AppColor.whitePrimary
                                  : AppColor.blackPrimary),
                    ),
                  ),
                ),
              );
            })
          ]),
        ));
  }
}
