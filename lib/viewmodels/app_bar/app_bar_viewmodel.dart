import 'dart:async';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_bar_state.dart';

part 'app_bar_viewmodel.g.dart';

@riverpod
class AppBarViewModel extends _$AppBarViewModel {
  Timer? _timer;

  @override
  // Initial State
  AppBarState build() {
    _startTimer();
    return AppBarState(
        selectedLanguage: "Thai", dateNumber: _getCurrentDateTime());
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateDateTime();
    });
  }

  // @override
  // void dispose() {
  //   print('AppBarViewModel is being disposed'); // Add this
  //   _timer?.cancel();
  //   super.dispose();
  // }

  void _updateDateTime() {
    state = state.copyWith(dateNumber: _getCurrentDateTime());
  }

  String _getCurrentDateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat("MM/dd/yyyy");
    final timeFormat = DateFormat('HH:mm:ss a');
    return "${dateFormat.format(now)}, ${timeFormat.format(now)}";
  }

  void updateLanguage(String language) {
    state = state.copyWith(selectedLanguage: language);
  }
}
