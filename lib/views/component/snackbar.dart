import 'package:flutter/material.dart';

SnackBar mySnackBar({required String text, required Color color}) {
  return SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    showCloseIcon: true,
  );
}

SnackBar anothersnackbar() {
  return SnackBar(
    content: const Text("Hello Flutter"),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.black54,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    showCloseIcon: true,
  );
}
