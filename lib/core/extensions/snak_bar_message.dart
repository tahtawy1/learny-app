import 'package:flutter/material.dart';

extension SnackBarMessage on BuildContext {
  void snackBar(String message, bool isSuccessful) {
    Color bgColor = isSuccessful ? Color(0xffeaf3ec) : Color(0xffffebeb);
    Color iconColor = isSuccessful ? Color(0xff2b813a) : Color(0xffd32f2f);
    IconData icon = isSuccessful
        ? Icons.check_circle_rounded
        : Icons.error_rounded;

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: const Duration(seconds: 2),
        content: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: bgColor,
            boxShadow: [
              BoxShadow(color: iconColor, blurRadius: 0, offset: Offset(0, 4)),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 35),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  maxLines: 2,
                  style: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
