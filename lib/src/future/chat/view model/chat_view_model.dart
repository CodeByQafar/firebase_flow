import 'package:mobx/mobx.dart';
import 'dart:io';

part 'chat_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store {
  //   static String baseUrl = EnvService.baseUrl + EnvService.bucketName;

  // ImageUploadService imageUploadService = ImageUploadService(
  //   Dio(BaseOptions(baseUrl: baseUrl)),
  // );

  @observable
  File? image;
 

  // @action
  // void changeLoading() {
  //   isLoading = !isLoading;
  // }

}

