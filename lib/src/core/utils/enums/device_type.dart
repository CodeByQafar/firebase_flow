import 'dart:io';

import '../exception/device_type_exception.dart';
import 'package:flutter/foundation.dart';

enum DeviceType { computer, phone }

extension DeviceTypeParse on DeviceType {
  static DeviceType parse(String device) {
    switch (device) {
      case "phone":
        return DeviceType.phone;
      case "computer":
        return DeviceType.computer;
      default:
        throw DeviceTypeException("Device is invalid");
    }
  }
}

extension DeviceTypeInfo on DeviceType {
  static DeviceType currentDeviceType() {
    if (kIsWeb) {
      return DeviceType.computer;
    }
    if (Platform.isAndroid || Platform.isIOS) {
      return DeviceType.phone;
    } else {
      return DeviceType.computer;
    }
  }
}
