import '../exception/device_type_exception.dart';

enum DeviceType {
  computer,
  phone
}

extension DeviceTypeParse on DeviceType{
 static DeviceType parse(String device){
    switch(device){
      case "phone":
      return  DeviceType.phone;
         case "computer":
      return  DeviceType.computer;
      default:
       throw DeviceTypeException("Device is invalid");
    }
  }  
}