import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_flow/src/future/chat/model/message_model.dart';
import 'package:firebase_flow/src/future/chat/model/response_model.dart';

import '../../../core/utils/enums/api_endpoints.dart';


abstract class IChatService {
  Future<dynamic> sendMessage(MessageModel message);
 Stream<List<MessageModel>> listenMessages();
}

class ChatService implements IChatService {
  final Dio dio;
  final String baseUrl;
    WebSocket? _socket;
  final _controller = StreamController<List<MessageModel>>.broadcast();

  ChatService({required this.dio, required this.baseUrl});
  @override
  Future<ResponseModel> sendMessage(MessageModel message) async {
    final response = await dio.post(
      "$baseUrl${ApiEndpoints.messages.name}/.json",
      data: message.toJson(),
    );
    // final result=await fetchMessages();
    // for (MessageModel element in result) {
    //   print("${element.message} ${element.deviceType}");
    // }
    print( "$baseUrl${ApiEndpoints.messages.name}/.json");
    if (response.statusCode == HttpStatus.ok) {
      return ResponseModel(isSuccses: true);
    } else {
      return ResponseModel(isSuccses: false);
    }
  }


 @override
  Stream<List<MessageModel>> listenMessages() {
    if (_socket != null) return _controller.stream;

    _connectSocket();
    return _controller.stream;
  }

  Future<void> _connectSocket() async {
    try {
      _socket = await WebSocket.connect("$baseUrl${ApiEndpoints.messages.name}.json");

      _socket!.listen(
        (event) {
          final data = jsonDecode(event);

          if (data is List) {
            final messages = data
                .map((e) => MessageModel.fromJson(e))
                .toList()
                .cast<MessageModel>();
            _controller.add(messages);
          } else if (data is Map<String, dynamic>) {
            // tək mesaj gəlirsə
            final message = MessageModel.fromJson(data);
            _controller.add([message]);
          }
        },
        onError: (error) {
          print("Socket Error: $error");
          _reconnect();
        },
        onDone: () {
          print("Socket bağlandı");
          _reconnect();
        },
      );
    } catch (e) {
      print("Socket bağlantısı alınmadı: $e");
      _reconnect();
    }
  }

  void _reconnect() {
    Future.delayed(const Duration(seconds: 3), () {
      _connectSocket();
    });
  }

  void dispose() {
    _socket?.close();
    _controller.close();
  }

}
