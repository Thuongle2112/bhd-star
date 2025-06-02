import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class TLoaders {
  static hideSnackBar(BuildContext context) => ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey.withOpacity(0.9) : TColors.grey.withOpacity(0.9),
          ),
          child: Center(child: Text(message, style: Theme.of(context).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static successSnackBar({required BuildContext context, required String title, String message = '', int duration = 3}) {
    _showSnackBar(context, title, message, TColors.primary, Icons.check, duration);
  }

  static warningSnackBar({required BuildContext context, required String title, String message = ''}) {
    _showSnackBar(context, title, message, Colors.orange, Icons.warning_amber_rounded, 3);
  }

  static errorSnackBar({required BuildContext context, required String title, String message = ''}) {
    _showSnackBar(context, title, message, Colors.red.shade600, Icons.error_outline, 3);
  }

  static void _showSnackBar(BuildContext context, String title, String message, Color backgroundColor, IconData icon, int duration) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration),
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text('$title\n$message', style: const TextStyle(color: Colors.white))),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
