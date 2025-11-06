import 'package:dio/dio.dart';
import 'package:firebase_flow/src/future/chat/model/message_model.dart';
import 'package:firebase_flow/src/future/chat/model/response_model.dart';

abstract class IChatService {
  Future<dynamic> sendMessage(MessageModel message);
  Future<List<MessageModel>> fetchMessages();
}

class ChatService implements IChatService {
  final Dio dio;
  final String baseUrl;
  ChatService({required this.dio, required this.baseUrl});
  @override
  Future<dynamic> sendMessage(MessageModel message) async {
    try {
      final response = await dio.put(baseUrl, data: message.toJson());
      return response;
    } catch (e) {
      return ResponseModel(false);
    }
  }

  @override
  Future<List<MessageModel>> fetchMessages() async {
    throw UnimplementedError();
  }
}
