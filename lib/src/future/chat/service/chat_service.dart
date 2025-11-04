import 'package:firebase_flow/src/future/chat/model/message_model.dart';
import 'package:firebase_flow/src/future/chat/model/response_model.dart';

abstract class IChatService {
  Future<ResponseModel> sendMessage();
  Future<List<MessageModel>> fetchMessages();
}

class ChatService implements IChatService {
  @override
  Future<ResponseModel> sendMessage() async {
    throw UnimplementedError();
  }

  @override
  Future<List<MessageModel>> fetchMessages() async {
    throw UnimplementedError();
  }
}
