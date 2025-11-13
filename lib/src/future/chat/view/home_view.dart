import 'package:firebase_flow/src/core/utils/enums/device_type.dart';
import 'package:firebase_flow/src/future/chat/view/widgets/button/send_button.dart';
import 'package:firebase_flow/src/future/chat/view/widgets/card/message_card.dart';
import 'package:firebase_flow/src/future/chat/view/widgets/text_fields/message_text_field.dart';
import 'package:flutter/material.dart';

import '../model/message_model.dart';
import '../view model/chat_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController textEditingController = TextEditingController();
  final ChatViewModel viewModel = ChatViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: StreamBuilder<List<MessageModel>>(
                    stream: viewModel.listenMessages(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                
                      final messages = snapshot.data!;
                      return ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final model = messages[index];
                
                          return MessageCard(
                            message: model.message,
                            date: model.date,
                            deviceType: model.deviceType,
                          ); // Animates rank changes smoothly
                        },
                      );
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MessageTextField(
                        textEditingController: textEditingController,
                      ),
                      SendButton(
                        message: textEditingController,
                        sendMessageFunction: viewModel.sendMessage,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
