import '../../../core/utils/enums/device_type.dart';

class MessageModel {
  String message;
  DateTime date;
  DeviceType deviceType;

  MessageModel({
    required this.message,
    required this.date,
    required this.deviceType,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'] ?? '',
      date: DateTime.parse(json['date']),
      deviceType: DeviceTypeParse.parse(json['deviceType']),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'date': date.toIso8601String(),
    'deviceType': deviceType.name,
  };
}
