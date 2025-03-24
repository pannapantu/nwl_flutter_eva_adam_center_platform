import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FraudType {
  laneViolation,
  speedExcess,
}

extension FraudTypeExtension on FraudType {
  String get title {
    switch (this) {
      case FraudType.laneViolation:
        return "ผิดช่องจราจร";

      case FraudType.speedExcess:
        return "ความเร็วเกินกำหนด";
    }
  }
}

enum VehicleType { truck, pickup, sedan, motorcycle }

extension VehicleTypeExtension on VehicleType {
  String get title {
    switch (this) {
      case VehicleType.truck:
        return "Truck";
      case VehicleType.pickup:
        return "Pickup";
      case VehicleType.sedan:
        return "Sedan";
      case VehicleType.motorcycle:
        return "Motorcycle";
    }
  }

  IconData get icon {
    switch (this) {
      case VehicleType.truck:
        return FontAwesomeIcons.truck;
      case VehicleType.pickup:
        return FontAwesomeIcons.truckPickup;
      case VehicleType.sedan:
        return FontAwesomeIcons.carSide;
      case VehicleType.motorcycle:
        return FontAwesomeIcons.motorcycle;
    }
  }
}

class ReportTable {
  int suggestedLane;
  int usedLane;
  int suggestedSpeed;
  int usedSpeed;
  String registrationNumber;
  String registrationImage;
  String carImage;
  FraudType fraudType;
  VehicleType vehicleType;

  ReportTable({
    required this.vehicleType,
    required this.suggestedLane,
    required this.usedLane,
    required this.usedSpeed,
    required this.suggestedSpeed,
    required this.fraudType,
    required this.registrationNumber,
    required this.registrationImage,
    required this.carImage,
  });
}
