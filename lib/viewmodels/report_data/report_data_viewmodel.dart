import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widgets_test/models/report_table_model.dart';
import 'package:widgets_test/viewmodels/report_data/report_data_state.dart';

part 'report_data_viewmodel.g.dart';

@riverpod
class ReportDataViewModel extends _$ReportDataViewModel {
  @override
  ReportDataState build() {
    return ReportDataState(
        startDate: "",
        endDate: "",
        currentPage: 0,
        itemPerPage: 6,
        listReport: _initialListReport);
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

  void changePage(int newPage) {
    state = state.copyWith(currentPage: newPage);
  }

  List<ReportTable> getPaginatedReports() {
    int startIndex = state.currentPage * state.itemPerPage;
    int endIndex = startIndex + state.itemPerPage;
    return state.listReport
        .sublist(startIndex, endIndex.clamp(0, state.listReport.length));
  }

  final List<ReportTable> _initialListReport = [
    ReportTable(
        vehicleType: VehicleType.truck,
        suggestedLane: 1,
        usedLane: 2,
        usedSpeed: 44,
        suggestedSpeed: 80,
        fraudType: FraudType.laneViolation,
        registrationNumber: "9รถ-2019",
        registrationImage: "assets/report_page/registration_number.jpg",
        carImage: "assets/report_page/truck.jpg"),
    ReportTable(
        vehicleType: VehicleType.pickup,
        suggestedLane: 2,
        usedLane: 3,
        usedSpeed: 44,
        suggestedSpeed: 80,
        fraudType: FraudType.laneViolation,
        registrationNumber: "9รถ-2019",
        registrationImage: "assets/report_page/registration_number.jpg",
        carImage: "assets/report_page/pickup.jpg"),
    ReportTable(
        vehicleType: VehicleType.sedan,
        suggestedLane: 3,
        usedLane: 4,
        usedSpeed: 90,
        suggestedSpeed: 80,
        fraudType: FraudType.speedExcess,
        registrationNumber: "9รถ-2019",
        registrationImage: "assets/report_page/registration_number.jpg",
        carImage: "assets/report_page/sedan.jpeg"),
    ReportTable(
        vehicleType: VehicleType.motorcycle,
        suggestedLane: 4,
        usedLane: 5,
        usedSpeed: 90,
        suggestedSpeed: 80,
        fraudType: FraudType.speedExcess,
        registrationNumber: "9รถ-2019",
        registrationImage: "assets/report_page/registration_number.jpg",
        carImage: "assets/report_page/pickup.jpg"),
    ReportTable(
      vehicleType: VehicleType.sedan,
      suggestedLane: 3,
      usedLane: 4,
      usedSpeed: 90,
      suggestedSpeed: 80,
      fraudType: FraudType.speedExcess,
      registrationNumber: "กข-1234",
      registrationImage: "assets/report_page/registration_number.jpg",
      carImage: "assets/report_page/sedan.jpeg",
    ),
    ReportTable(
      vehicleType: VehicleType.motorcycle,
      suggestedLane: 2,
      usedLane: 3,
      usedSpeed: 70,
      suggestedSpeed: 60,
      fraudType: FraudType.laneViolation,
      registrationNumber: "ขว-5678",
      registrationImage: "assets/report_page/registration_number.jpg",
      carImage: "assets/report_page/pickup.jpg",
    ),
    ReportTable(
      vehicleType: VehicleType.truck,
      suggestedLane: 1,
      usedLane: 3,
      usedSpeed: 85,
      suggestedSpeed: 60,
      fraudType: FraudType.speedExcess,
      registrationNumber: "ตย-9901",
      registrationImage: "assets/report_page/registration_number.jpg",
      carImage: "assets/report_page/sedan.jpeg",
    ),
    ReportTable(
      vehicleType: VehicleType.pickup,
      suggestedLane: 2,
      usedLane: 3,
      usedSpeed: 95,
      suggestedSpeed: 70,
      fraudType: FraudType.speedExcess,
      registrationNumber: "บย-2244",
      registrationImage: "assets/report_page/registration_number.jpg",
      carImage: "assets/report_page/pickup.jpg",
    ),
    ReportTable(
      vehicleType: VehicleType.sedan,
      suggestedLane: 3,
      usedLane: 4,
      usedSpeed: 100,
      suggestedSpeed: 80,
      fraudType: FraudType.laneViolation,
      registrationNumber: "วศ-3321",
      registrationImage: "assets/report_page/registration_number.jpg",
      carImage: "assets/report_page/sedan.jpeg",
    ),
    ReportTable(
      vehicleType: VehicleType.pickup,
      suggestedLane: 2,
      usedLane: 5,
      usedSpeed: 110,
      suggestedSpeed: 90,
      fraudType: FraudType.speedExcess,
      registrationNumber: "งน-8822",
      registrationImage: "assets/report_page/registration_number.jpg",
      carImage: "assets/report_page/pickup.jpg",
    )
  ];
}
