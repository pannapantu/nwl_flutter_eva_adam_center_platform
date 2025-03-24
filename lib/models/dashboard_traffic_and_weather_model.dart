import 'package:widgets_test/models/traffic_model.dart';
import 'package:widgets_test/models/weather_model.dart';

class DashboardTrafficAndWeather {
  final List<Traffic> listOfCars;
  final Weather weather;

  DashboardTrafficAndWeather({required this.listOfCars, required this.weather});
}
