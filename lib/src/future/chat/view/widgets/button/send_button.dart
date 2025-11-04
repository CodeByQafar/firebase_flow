import '../../../../../core/constants/padding.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.message});
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.iconButtonPadding,
      child: IconButton(
        alignment: Alignment.center,
        padding: Paddings.iconButtonContentPadding,

        onPressed: () {},
        icon: Icon(
          Icons.send,
          size: 20,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
