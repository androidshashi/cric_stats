import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Shows snack bar
void showSnackBar(
    {required BuildContext context,
    required String content,
    required bool success}) {
  if (!context.mounted) return;
  final snackBar = SnackBar(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    content: Text(
      content,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: success
        ? Theme.of(context).primaryColor.withOpacity(0.5)
        : Colors.red.withOpacity(0.5),
    duration: const Duration(seconds: 2),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/// Print the log in formatted way
void debugLog(String? text) {
  if (kDebugMode) {
    debugPrint("##################\n$text\n>>>>>>>>>>>>>>>>>");
  }
}

/// Hide the soft keyboard
void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
