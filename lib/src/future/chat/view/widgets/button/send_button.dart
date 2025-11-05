import 'package:firebase_flow/src/core/utils/enums/device_type.dart';
import 'package:firebase_flow/src/future/chat/model/message_model.dart';
import '../../../../../core/constants/padding.dart';
import 'package:flutter/material.dart';

class SendButton extends StatefulWidget {
   TextEditingController message;
    Function(MessageModel) sendMessageFunction;

  SendButton({required this.message, required this.sendMessageFunction, super.key});

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.iconButtonPadding,
      child: IconButton(
        alignment: Alignment.center,
        padding: Paddings.iconButtonContentPadding,
        onPressed:(){
          widget.sendMessageFunction(
          MessageModel(
            message: widget.message.text,
            date: DateTime.now(),
            deviceType: DeviceType.computer,
          ),
        );}, 
        icon: Icon(
          Icons.send,
          size: 20,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
