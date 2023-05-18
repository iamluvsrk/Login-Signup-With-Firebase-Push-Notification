import 'package:flutter/material.dart';

// Global Button Widget For the app
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.buttonText,
      required this.onTap,
      required this.buttonColor,
      this.isLoading = false});
  final String buttonText;
  final Color? buttonColor;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: onTap,
      color: buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              buttonText,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white70),
            ),
    );
  }
}
