import 'package:flutter/material.dart';
import 'package:login_demo/constants/theme.dart';

//Global Appbar for the app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key, this.title, required this.showbackButton, this.backFunction});
  final String? title;
  final bool showbackButton;
  final Function()? backFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 12),
      child: SafeArea(
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      color: ColorConstants.white,
                      borderRadius: BorderRadius.circular(32)),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
