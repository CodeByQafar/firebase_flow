import 'package:firebase_flow/src/core/utils/enums/device_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/boxconstrants.dart';
import '../../../../../core/constants/padding.dart';
import '../../../../../core/utils/extension/date_time_extension.dart';
import '../../../../../core/utils/snackbars/snackbar_manager.dart';

class MessageCard extends StatelessWidget {
  final String message;
  final DateTime date;
  final DeviceType deviceType;
  const MessageCard({
    required this.message,
    required this.date,
    required this.deviceType,
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
        mainAxisAlignment: deviceType==DeviceTypeInfo.currentDeviceType()
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          deviceType==DeviceTypeInfo.currentDeviceType() ? Text(TimeFormat.formatTimeHM(date)) : SizedBox.shrink(),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width *
                  AppBoxconstrants.messageCardBoxConstranstWidth,
            ),
            child: Card(
              child: Padding(
                padding: deviceType==DeviceTypeInfo.currentDeviceType()
                    ? Paddings.phoneMesaggeCardPadding
                    : Paddings.computerMesaggeCardPadding,
                child: SelectableText(message),
              ),
            ),
          ),
          deviceType==DeviceTypeInfo.currentDeviceType() ? SizedBox.shrink() : Text(TimeFormat.formatTimeHM(date)) ,
        ],
      ),
    );
  }
}
