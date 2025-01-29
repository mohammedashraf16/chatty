import 'package:flutter/material.dart';

void showLoading(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(
              color: Color(0xFF3598DB),
            ),
            const SizedBox(width: 15),
            Text(text),
          ],
        ),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(BuildContext context, String message, String posActionText,
    Function posAction,
    {String? negActionText, String? negAction}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                posAction(context);
              },
              child: Text(posActionText))
        ],
      );
    },
  );
}
