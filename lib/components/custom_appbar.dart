import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'neubutton.dart';

class CustomAppBar extends StatelessWidget {
  final IconData firstIcon;
  final VoidCallback onFirstTap;
  final VoidCallback onSecondTap;
  final IconData secondIcon;
  final String title;
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.firstIcon,
      required this.secondIcon,
      required this.onFirstTap,
      required this.onSecondTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NeuButton(
            icon: firstIcon,
            onTap: onFirstTap,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          NeuButton(
            icon: secondIcon,
            onTap: onSecondTap,
          ),
        ],
      ),
    );
  }
}
