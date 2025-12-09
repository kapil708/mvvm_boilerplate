import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum SnackBarType { success, info, warning, error }

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
