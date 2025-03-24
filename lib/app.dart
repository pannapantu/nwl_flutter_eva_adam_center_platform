import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/constants/custom_scroll_behavior.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/views/dashboard/dashboard_page.dart';
import 'package:widgets_test/views/format_message_manage/format_message_manage_page.dart';
import 'package:widgets_test/views/home/home_page.dart';
import 'package:widgets_test/views/location/location_page.dart';
import 'package:widgets_test/views/map/map_page.dart';
import 'package:widgets_test/views/message_manage/message_manage_page.dart';
import 'package:widgets_test/views/report/report_page.dart';
import 'package:widgets_test/widgets/common/app_bar.dart';

// Routing Management in App
class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Eva Project Demo',
      theme: ThemeData(
        dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: const TextStyle(fontSize: 14.0),
            menuStyle: const MenuStyle(
                backgroundColor: WidgetStatePropertyAll(AppColor.whitePrimary)),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0))),
        textTheme: const TextTheme(
            labelLarge: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: AppColor.blackPrimary)),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                alignment: Alignment.center,
                overlayColor: const WidgetStatePropertyAll(AppColor.buttonHover),
                textStyle: const WidgetStatePropertyAll(TextStyle(
                  color: AppColor.blackPrimary,
                )),
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 18.0, vertical: 22.0)),
                iconColor: const WidgetStatePropertyAll(AppColor.blackIcon),
                iconSize: const WidgetStatePropertyAll(18.0),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 0.1, color: AppColor.blackAlpha45Primary),
                    borderRadius: BorderRadius.circular(6.0))))),
        iconTheme: const IconThemeData(color: AppColor.blackIcon),
        useMaterial3: true,
      ),
      routerConfig: _router,
      scrollBehavior: CustomScrollBehavior(),
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: HomePage(),
                ),
              ),
          routes: [
       
            GoRoute(
              path: 'report',
              builder: (context, state) => const Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: ReportPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'message_manage',
              builder: (context, state) => const Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: MessageManagementPage(),
              ),
            ),
            GoRoute(
              path: 'format_message_manage',
              builder: (context, state) => const Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: FormatMessageManagePage(),
              ),
            ),
            GoRoute(
              path: 'location',
              builder: (context, state) => const Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: LocationPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'dashboard',
              builder: (context, state) => const Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: DashboardPage(),
                ),
              ),
            ),
            GoRoute(
              path: 'map',
              builder: (context, state) => const Scaffold(
                backgroundColor: AppColor.bgColor,
                appBar: AppBarScreen(),
                body: Center(
                  child: MapPage(),
                ),
              ),
            ),
          ]),
      // Add more routes here as needed
    ],
  );
}
