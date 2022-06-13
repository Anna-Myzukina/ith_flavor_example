import 'package:flutter/material.dart';

class ValueSlider extends StatefulWidget {
  final Function(int) onChanged;
  final Color activeColor;
  const ValueSlider(
      {required this.onChanged, Key? key, required this.activeColor})
      : super(key: key);

  @override
  State<ValueSlider> createState() => _ValueSliderState();
}

class _ValueSliderState extends State<ValueSlider> {
  double sliderValue = 160;

  List<Text> divisions = [
    const Text("230"),
    const Text("210"),
    const Text("190"),
    const Text("170"),
    const Text("150"),
    const Text("130"),
    const Text("110"),
  ];
  List<Widget> generateDividers() {
    List<Widget> dividers = [];
    for (int i = 0; i < 13; i++) {
      if (i % 2 == 0) {
        dividers.add(
          const SizedBox(
            width: 20,
            child: Divider(
              thickness: 1,
              color: Color(0xff6C758C),
            ),
          ),
        );
      } else {
        dividers.add(
          const SizedBox(
            height: 0,
            width: 10,
            child: Divider(
              thickness: 1,
              color: Color(0xff6C758C),
            ),
          ),
        );
      }
    }
    return dividers;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 0, bottom: 20, top: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: SizedBox(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    overlayShape: SliderComponentShape.noOverlay,
                    activeTrackColor: widget.activeColor,
                    activeTickMarkColor: Colors.transparent,
                    inactiveTickMarkColor: Colors.transparent,
                    inactiveTrackColor: const Color(0xffE2E2E2),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 13),
                    thumbColor: const Color(0xffEEEEEE)),
                child: Slider(
                  divisions: 12,
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                      List<String> divisionsTexts =
                          divisions.map((e) => e.data!).toList();
                      if (divisionsTexts
                          .contains(sliderValue.toInt().toString())) {
                        int index = divisionsTexts
                            .indexOf(sliderValue.toInt().toString());

                        Text bigText = Text(
                          divisionsTexts[index],
                          style: const TextStyle(fontSize: 17),
                        );

                        divisionsTexts.asMap().forEach((key, value) {
                          if (key == index) {
                            divisions[key] = bigText;
                          } else {
                            divisions[key] = Text(value);
                          }
                        });
                      } else {
                        divisionsTexts.asMap().forEach((key, value) {
                          divisions[key] = Text(value);
                        });
                      }
                    });

                    widget.onChanged(value.toInt());
                  },
                  min: 110,
                  max: 230,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: generateDividers(),
            ),
          ),
          SizedBox(
            width: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: divisions,
            ),
          )
        ],
      ),
    );
  }
}
