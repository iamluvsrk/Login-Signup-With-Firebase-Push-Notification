import 'package:flutter/material.dart';
import 'package:login_demo/constants/theme.dart';

// Label Widget to show to textfiled labels
class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyle.label,
    );
  }
}
