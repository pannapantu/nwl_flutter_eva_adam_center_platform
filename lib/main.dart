import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/app.dart';
import 'package:widgets_test/constants/custom_scroll_behavior.dart';
import 'package:widgets_test/theme/color.dart';

//Focus on Entry & State Management.
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
      debugShowCheckedModeBanner: false,
      title: 'Eva Project Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: AppColor.blackPrimary),
        useMaterial3: true,
      ),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
