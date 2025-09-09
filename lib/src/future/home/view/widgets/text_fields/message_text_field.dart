import 'package:flutter/material.dart';

import '../../../../../core/constants/padding.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({super.key,required this.textEditingController});
 final TextEditingController textEditingController;
  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  @override
  Widget build(BuildContext context) {
    return      Expanded(
      child: Padding(
        padding: Paddings.textFieldPadding,
        child: TextField(
          onChanged: (value) {
            setState(() {
              widget.textEditingController.text = value;

            });
          },
          cursorColor: Theme.of(
            context,
          ).colorScheme.onTertiary,
          decoration: InputDecoration(
            hintText: 'Type a message',

            hintStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
