import 'package:dio/dio.dart';
import 'package:firebase_flow/src/core/utils/services/env_service.dart';
import 'package:firebase_flow/src/future/chat/model/message_model.dart';
import 'package:mobx/mobx.dart';

import '../service/chat_service.dart';

part 'chat_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store {
  static String baseUrl = EnvService.baseUrl;

  IChatService chatService = ChatService(
    dio: Dio(BaseOptions(baseUrl: baseUrl)),
    baseUrl: baseUrl,
  );

  // @observable
  // MessageModel message;

  @action
  void sendMessage(MessageModel message) {
    chatService.sendMessage(message);
  }


}
