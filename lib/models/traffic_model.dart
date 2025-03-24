import 'package:flutter/material.dart';

enum VehicleType { motorcycle, car, bus, truck }

extension VehicleTypeExtension on VehicleType {
  String get title {
    switch (this) {
      case VehicleType.motorcycle:
        return "รถจักรยานยนต์";
      case VehicleType.car:
        return "รถยนต์ส่วนบุคคล";
      case VehicleType.bus:
        return "รถบัส";
      case VehicleType.truck:
        return "รถบรรทุก";
    }
  }

  Color get color {
    switch (this) {
      case VehicleType.motorcycle:
        return const Color(0xFFff4560);
      case VehicleType.car:
        return const Color(0xFFfeb019);
      case VehicleType.bus:
        return const Color(0xFF00e396);
      case VehicleType.truck:
        return const Color(0xFF008ffb);
    }
  }
}

class Traffic {
  final VehicleType vehicleType;
  final int speed;
  final String place;
  Traffic({
    required this.vehicleType,
    required this.speed,
    required this.place,
  });
}
