import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_flow/src/future/chat/model/message_model.dart';
import 'package:firebase_flow/src/future/chat/model/response_model.dart';

import '../../../core/utils/enums/api_endpoints.dart';
import '../../../core/utils/enums/device_type.dart';

abstract class IChatService {
  Future<dynamic> sendMessage(MessageModel message);
  Future<List<MessageModel>> fetchMessages();
}

class ChatService implements IChatService {
  final Dio dio;
  final String baseUrl;
  ChatService({required this.dio, required this.baseUrl});
  @override
  Future<ResponseModel> sendMessage(MessageModel message) async {
    final response = await dio.put(
      "$baseUrl${ApiEndpoints.messages.name}/1/.json",
      data: message.toJson(),
    );
    if (response.statusCode == HttpStatus.ok) {
      return ResponseModel(isSuccses: true);
    } else {
      return ResponseModel(isSuccses: false);
    }
  }

  @override
  Future<List<MessageModel>> fetchMessages() async {
    final response = await dio.get(baseUrl + "/.json");
    final List<MessageModel> messages = [
      MessageModel(
        message: "widget.message.text",
        date: DateTime.now(),
        deviceType: DeviceType.computer,
      ),
    ];

    if (response.statusCode == HttpStatus.ok) {
      print(response.data);
      // return ResponseModel(isSuccses: true);
    } else {
      // return ResponseModel(isSuccses: false);
    }
    return messages;
  }
}
