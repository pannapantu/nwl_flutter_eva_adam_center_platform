import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/models/list_sidebar_menu_model.dart';
import 'package:widgets_test/viewmodels/main_menu/main_menu_viewmodel.dart';
import 'package:widgets_test/theme/color.dart';

class Sidebar extends ConsumerStatefulWidget {
  const Sidebar({super.key});

  @override
  ConsumerState<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends ConsumerState<Sidebar> {
  final Map<String, bool> expandedItem = {};
  final Map<String, bool> hoveredItem = {};
  final Map<String, bool> hoveredList = {};

  @override
  Widget build(BuildContext context) {
    final mainMenuState = ref.watch(mainMenuViewModelProvider);
    final routeNow =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();

    return Drawer(
        backgroundColor: AppColor.blackAlpha45Primary,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                color: AppColor.blackPrimary,
                onPressed: ref
                    .read(mainMenuViewModelProvider.notifier)
                    .setSidebarStatus,
                icon: const Icon(
                  Icons.close_fullscreen_outlined,
                  size: 24.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ...?mainMenuState.selectedListMenu
                ?.map((menu) => _buildExpansionTile(menu, routeNow)),
          ]),
        ));
  }

  /// **Recursive function to render unlimited levels of `ExpansionTile`**
  Widget _buildExpansionTile(
    ListSidebarMenu item,
    String routeNow,
  ) {
    if (item.submenu != null && item.submenu!.isNotEmpty) {
      final ValueNotifier<Color> tileColor = ValueNotifier(Colors.transparent);

      return ValueListenableBuilder(
          valueListenable: tileColor,
          builder: (context, color, child) {
            return MouseRegion(
              onExit: (_) {
                tileColor.value = Colors.transparent;
                hoveredItem[item.title] = false;
              },
              onEnter: (_) {
                tileColor.value = AppColor.redColor;
                hoveredItem[item.title] = true;
              },
              child: Container(
                color: ref
                        .read(mainMenuViewModelProvider.notifier)
                        .isRouteMatch(item, routeNow)
                    ? AppColor.redColor
                    : hoveredItem[item.title] == true
                        ? AppColor.redColor.withValues(alpha: 0.3)
                        : Colors.transparent,
                child: ExpansionTile(
                  onExpansionChanged: (isItemExpanded) {
                    setState(() {
                      expandedItem[item.title] = isItemExpanded;
                    });
                  },
                  iconColor: ref
                          .read(mainMenuViewModelProvider.notifier)
                          .isRouteMatch(item, routeNow)
                      ? AppColor.whitePrimary
                      : hoveredItem[item.title] == true
                          ? AppColor.whitePrimary
                          : (expandedItem[item.title] == true &&
                                  item.route == routeNow)
                              ? AppColor.whitePrimary
                              : AppColor.blackPrimary,
                  collapsedIconColor: hoveredItem[item.title] == true
                      ? AppColor.whitePrimary
                      : (expandedItem[item.title] == true &&
                              item.route == routeNow)
                          ? AppColor.whitePrimary
                          : AppColor.blackPrimary,
                  expansionAnimationStyle: AnimationStyle(
                      curve: const ElasticOutCurve(0.8),
                      duration: const Duration(milliseconds: 300)),
                  childrenPadding: const EdgeInsets.only(left: 8.0),
                  backgroundColor: AppColor.redColor,
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: ref
                                .read(mainMenuViewModelProvider.notifier)
                                .isRouteMatch(item, routeNow)
                            ? AppColor.whitePrimary
                            : hoveredItem[item.title] == true
                                ? AppColor.whitePrimary
                                : (expandedItem[item.title] == true &&
                                        item.route == routeNow)
                                    ? AppColor.whitePrimary
                                    : AppColor.blackPrimary),
                  ),
                  leading: Icon(
                    item.icon,
                    color: ref
                            .read(mainMenuViewModelProvider.notifier)
                            .isRouteMatch(item, routeNow)
                        ? AppColor.whitePrimary
                        : hoveredItem[item.title] == true
                            ? AppColor.whitePrimary
                            : AppColor.blackPrimary,
                    size: 22.0,
                  ),
                  children: item.submenu!
                      .map((submenu) => _buildExpansionTile(
                            submenu,
                            routeNow,
                          )) // Recursion here
                      .toList(),
                ),
              ),
            );
          });
    } else {
      return Material(
        color: ref
                .read(mainMenuViewModelProvider.notifier)
                .isRouteMatch(item, routeNow)
            ? AppColor.redColor
            : Colors.transparent,
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              hoveredList[item.title] = true;
            });
          },
          onExit: (_) {
            setState(() {
              hoveredList[item.title] = false;
            });
          },
          child: ListTile(
            hoverColor: AppColor.redColor.withValues(alpha: 0.3),
            title: Text(
              item.title,
              style: const TextStyle(fontSize: 14.0),
            ),
            textColor: hoveredList[item.title] == true
                ? AppColor.whitePrimary
                : ref
                        .read(mainMenuViewModelProvider.notifier)
                        .isRouteMatch(item, routeNow)
                    ? AppColor.whitePrimary
                    : AppColor.blackPrimary,
            leading: item.icon != null
                ? Icon(
                    item.icon,
                    color: ref
                            .read(mainMenuViewModelProvider.notifier)
                            .isRouteMatch(item, routeNow)
                        ? AppColor.whitePrimary
                        : hoveredList[item.title] == true
                            ? AppColor.whitePrimary
                            : AppColor.blackPrimary,
                  )
                : null,
            onTap: () {
              if (item.route != null) {
                context.go("/${item.route}");
              }
            },
          ),
        ),
      );
    }
  }
}
