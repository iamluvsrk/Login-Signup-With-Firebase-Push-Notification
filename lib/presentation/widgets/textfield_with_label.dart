import 'package:flutter/material.dart';
import 'package:login_demo/constants/theme.dart';
import 'package:login_demo/presentation/widgets/label.dart';

// Textfield Widget
class TextfieldWithlabel extends StatelessWidget {
  const TextfieldWithlabel({
    super.key,
    required this.label,
    this.controller,
    required this.autofocus,
    this.textInputType,
    required this.textCapitalization,
    this.fillColor,
    this.obscureText = false,
    this.maxLines,
    this.hintText,
    this.maxLength,
    this.onChanged,
  });
  final String label;
  final TextEditingController? controller;
  final bool autofocus;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final int? maxLines;
  final String? hintText;
  final bool obscureText;
  final Function(String v)? onChanged;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWidget(
          label: label,
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 56,
          decoration: BoxDecoration(
              color: fillColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x1e0094a8),
                    blurRadius: 24,
                    offset: Offset(0, 4))
              ]),
          child: Center(
            child: TextFormField(
              controller: controller,
              style: AppTextStyle.label,
              obscureText: obscureText,
              keyboardType: textInputType,
              textCapitalization: textCapitalization,
              onChanged: onChanged,
              maxLength: maxLength,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyle.label.copyWith(color: Colors.grey[500]),
                counterText: '',
                contentPadding: const EdgeInsets.only(left: 16, right: 16),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: fillColor,
                filled: true,
              ),
            ),
          ),
        )
      ],
    );
  }
}
