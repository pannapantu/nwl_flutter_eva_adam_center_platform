import 'package:widgets_test/models/dashboard_traffic_and_weather_model.dart';

class DashboardState {
  final String startDate;
  final String endDate;
  final List<DashboardTrafficAndWeather> listOfTrafficAndWeather;

  DashboardState(
      {required this.startDate,
      required this.endDate,
      required this.listOfTrafficAndWeather});

  DashboardState copyWith({
    String? startDate,
    String? endDate,
    List<DashboardTrafficAndWeather>? listOfTrafficAndWeather,
  }) {
    return DashboardState(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        listOfTrafficAndWeather: listOfTrafficAndWeather ?? this.listOfTrafficAndWeather);
  }
}
