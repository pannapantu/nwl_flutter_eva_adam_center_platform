import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/dashboard_traffic_and_weather_model.dart';
import 'package:widgets_test/models/traffic_model.dart';
import 'package:widgets_test/models/weather_model.dart';
import 'package:widgets_test/viewmodels/dashboard/dashboard_state.dart';

part 'dashboard_viewmodel.g.dart';

@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  @override
  DashboardState build() {
    return DashboardState(
        startDate: "",
        endDate: "",
        listOfTrafficAndWeather: _initialTrafficAndWeather);
  }

  void setStartDate(DateTime selectedDate) {
    final dateFormat = DateFormat('MM/dd/yyyy');
    final timeFormat = DateFormat('HH:mm a');
    final formattedDate =
        "${dateFormat.format(selectedDate)} ${timeFormat.format(selectedDate)}";
    state = state.copyWith(startDate: formattedDate);
  }

  void setEndDate(DateTime selectedDate) {
    final dateFormat = DateFormat('MM/dd/yyyy');
    final timeFormat = DateFormat('HH:mm a');
    final formattedDate =
        "${dateFormat.format(selectedDate)} ${timeFormat.format(selectedDate)}";
    state = state.copyWith(endDate: formattedDate);
  }

  final List<DashboardTrafficAndWeather> _initialTrafficAndWeather = [
    DashboardTrafficAndWeather(
        listOfCars: [
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 123,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 108, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 51, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 147,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 150, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 97,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 130,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 115,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 140, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 74, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 88,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 95, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 78,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 101, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 135, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 90,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 122,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 110, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 99,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 145, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 60, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 80,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 118, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 135,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 104, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 93,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 142, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 75,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 100,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 115, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 129, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 85,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 140,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 77, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 108, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 120,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 60,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 144, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 98,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 87, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 126,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 110, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 90,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 75,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 130, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 123, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 140,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 60,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 100, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 113, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 62,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 67,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 82,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 142,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 89,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 121, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 140,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 128,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 105, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 83, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 137, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 98, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 63, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 100,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 85,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 110, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 92, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 145, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 75,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 101, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.car, speed: 119, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 143,
              place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 67, place: "สุขุมวิท-นิคม"),
          Traffic(
              vehicleType: VehicleType.truck,
              speed: 147,
              place: "สุขุมวิท-นิคม"),
        ],
        weather: Weather(
            temperature: 29, wind: 10, moisture: 90, rain: 0, pm25: 10)),
    DashboardTrafficAndWeather(
        listOfCars: [
          Traffic(vehicleType: VehicleType.car, speed: 35, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.car, speed: 136, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.car, speed: 130, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 71, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 86,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 129, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 61,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 137,
              place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 94, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 73, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 113, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 111, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 52, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 95, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 92, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 133,
              place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 67, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 100, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 64,
              place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 43, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 102, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 117, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 93, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 120, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.bus, speed: 66, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.car, speed: 140, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 146,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 96, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 90, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 62,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.car, speed: 138, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 101, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.bus, speed: 77, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 149,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 131, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 104,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 75, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.car, speed: 79, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 70,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 147, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.car, speed: 114, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.motorcycle,
              speed: 59,
              place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 87, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 145, place: "บางนา-ตราด"),
          Traffic(vehicleType: VehicleType.bus, speed: 58, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.car, speed: 139, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 125, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.truck, speed: 148, place: "บางนา-ตราด"),
          Traffic(
              vehicleType: VehicleType.bus, speed: 109, place: "บางนา-ตราด"),
        ],
        weather: Weather(
            temperature: 32, wind: 14, moisture: 90, rain: 0, pm25: 20)),
  ];
}
