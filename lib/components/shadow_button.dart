import 'package:flutter/material.dart';
import 'package:ith/components/shadow_container.dart';

class ShadowButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final bool isFemale;
  final VoidCallback onTap;
  const ShadowButton({
    required this.isFemale,
    required this.onTap,
    this.isActive = false,
    required this.text,
    Key? key,
    required this.maxWidth,
  }) : super(key: key);

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ShadowContainer(
        child: TextButton(
            style: TextButton.styleFrom(
                elevation: 0,
                primary: Colors.black12,
                splashFactory: NoSplash.splashFactory,
                shadowColor: const Color(0xffD1CDC7),
                maximumSize: Size(maxWidth / 2, 100),
                minimumSize: Size(maxWidth / 4, 20),
                backgroundColor:
                    isActive ? !isFemale? const Color(0xff56D0DD):const Color(0xffe7c6ff) : const Color(0xffEEEEEE) ,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                text,
                style: TextStyle(color: isActive ? Colors.white : Colors.black),
              ),
            )),
      ),
    );
  }
}
