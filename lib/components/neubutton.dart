import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NeuButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const NeuButton({
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xffEEEEEE),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff9eadb6),
                  offset:  Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2.0, -2.0),
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
              ]),
          child: Center(
            child: FaIcon(
              icon,
              size: 20,
              color: Colors.black,
            ),
          ),
        ));
  }
}
