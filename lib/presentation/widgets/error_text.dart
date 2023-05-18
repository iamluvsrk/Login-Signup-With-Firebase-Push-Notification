import 'package:flutter/material.dart';
import 'package:login_demo/constants/theme.dart';

// Error Text widget to show the error.
class ErrorText extends StatelessWidget {
  const ErrorText({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          text!,
          style: AppTextStyle.label.copyWith(color: Colors.red),
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}
