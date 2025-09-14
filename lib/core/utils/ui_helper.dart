import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum SnackBarType { success, info, warning, error }

showSnackBar(BuildContext context, SnackBarType type, String message) {
  late CustomSnackBar customSnackBar;
  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: type == SnackBarType.success ? Colors.black : Colors.white,
  );

  switch (type) {
    case SnackBarType.info:
      customSnackBar = CustomSnackBar.info(
        message: message,
        textStyle: textStyle,
        icon: const Icon(Icons.info_outline, color: Color(0x15000000), size: 120),
        backgroundColor: Colors.blueAccent,
      );
      break;
    case SnackBarType.error:
      customSnackBar = CustomSnackBar.error(
        message: message,
        textStyle: textStyle,
        icon: const Icon(Icons.error_outline, color: Color(0x15000000), size: 120),
        backgroundColor: Colors.redAccent,
      );
      break;
    case SnackBarType.success:
      customSnackBar = CustomSnackBar.success(
        message: message,
        textStyle: textStyle,
        icon: const Icon(Icons.verified_outlined, color: Color(0x15000000), size: 120),
        backgroundColor: Colors.lightGreenAccent,
      );
      break;
    case SnackBarType.warning:
      customSnackBar = CustomSnackBar.info(
        message: message,
        textStyle: textStyle,
        icon: const Icon(Icons.warning_amber, color: Color(0x15000000), size: 120),
        backgroundColor: Colors.orangeAccent,
      );
      break;
  }

  return showTopSnackBar(
    Overlay.of(context),
    customSnackBar,
    dismissType: DismissType.onTap,
    displayDuration: const Duration(milliseconds: 500),
  );
}

showAlertDialog({
  required BuildContext context,
  String? title,
  TextStyle? titleStyle,
  Widget? titleWidget,
  bool hideTitle = false,
  required String body,
  Widget? bodyWidget,
  TextStyle? bodyStyle,
  List<Widget>? actions,
  String? defaultActionText,
  VoidCallback? defaultActionOnPressed,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog.adaptive(
        title: !hideTitle
            ? titleWidget ??
                Text(
                  title ?? 'Alert!',
                  style: titleStyle,
                )
            : null,
        content: bodyWidget ??
            Text(
              body,
              style: bodyStyle ?? Theme.of(context).textTheme.bodyLarge,
            ),
        actions: actions ??
            [
              TextButton(
                onPressed: defaultActionOnPressed ?? () => context.pop(),
                child: Text(
                  defaultActionText ?? "Okay",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
              ),
            ],
      );
    },
  );
}
