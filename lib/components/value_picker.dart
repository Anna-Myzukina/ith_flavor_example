import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ith/components/shadow_container.dart';

import 'neubutton.dart';

class ValuePicker extends StatefulWidget {
  final int initialValue;
  final String label;
  final ValueChanged<int> onChanged;
  const ValuePicker({
    required this.onChanged,
    required this.label,
    required this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  State<ValuePicker> createState() => _ValuePickerState();
}

class _ValuePickerState extends State<ValuePicker> {
  late int value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    widget.onChanged(value);
    return ShadowContainer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NeuButton(
                icon: FontAwesomeIcons.plus,
                onTap: () {
                  setState(() => value++);
                }),
            NeuButton(
                icon: FontAwesomeIcons.minus,
                onTap: () {
                  setState(() => value--);
                })
          ],
        )
      ],
    ));
  }
}
