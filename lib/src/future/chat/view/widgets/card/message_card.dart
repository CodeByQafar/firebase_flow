import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/boxconstrants.dart';
import '../../../../../core/constants/padding.dart';
import '../../../../../core/utils/snackbars/snackbar_manager.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final String date;
  final bool isPhoneMesaage;
  const MessageCard({
    required this.message,
    required this.date,
    required this.isPhoneMesaage,
    super.key,
  });

  void setMessageToClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setMessageToClipboard(context, message);
        SnackbarManager.showSnackBar(context, "Text Coppied to clipborad");
      },
      child: Row(
        mainAxisAlignment: isPhoneMesaage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          isPhoneMesaage ? Text(date) : SizedBox.shrink(),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width *
                  AppBoxconstrants.messageCardBoxConstranstWidth,
            ),
            child: Card(
              child: Padding(
                padding: isPhoneMesaage
                    ? Paddings.phoneMesaggeCardPadding
                    : Paddings.computerMesaggeCardPadding,
                child: SelectableText(message),
              ),
            ),
          ),
          isPhoneMesaage ? SizedBox.shrink() : Text(date),
        ],
      ),
    );
  }
}
