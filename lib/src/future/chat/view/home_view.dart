import 'package:firebase_flow/src/core/constants/padding.dart';
import 'package:firebase_flow/src/future/chat/view/widgets/button/send_button.dart';
import 'package:firebase_flow/src/future/chat/view/widgets/card/message_card.dart';
import 'package:firebase_flow/src/future/chat/view/widgets/text_fields/message_text_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MessageCard(
                      message:
                          "This message is sent from computer This message is sent from computer",
                      date: "14:23",
                      isPhoneMesaage: false,
                    ),
                    MessageCard(
                      message:
                          "This message is sent from computer This message is sent from computer",
                      date: "14:23",
                      isPhoneMesaage: false,
                    ),

                    MessageCard(
                      message: 'This message is sent from mobile message is sent from mobile',
                      date: "14:23",
                      isPhoneMesaage: true,
                    ),
                  ],
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
                      SendButton(message: textEditingController.text),
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
