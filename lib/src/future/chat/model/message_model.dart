import '../../../core/utils/enums/device_type.dart';

class MessageModel {
  String message;
  DateTime date;
  DeviceType deviceType;

  MessageModel(this.message,this.date,this.deviceType);
}