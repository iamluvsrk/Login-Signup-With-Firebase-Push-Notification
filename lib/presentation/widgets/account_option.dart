import 'package:flutter/material.dart';

class AccountOptionWidget extends StatelessWidget {
  const AccountOptionWidget(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});
  final String text1;
  final String text2;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text1),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              text2,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
