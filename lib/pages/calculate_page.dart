import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ith/components/custom_appbar.dart';
import 'package:ith/components/shadow_button.dart';
import 'package:ith/components/shadow_container.dart';
import 'package:ith/helpers/calculate_bmi.dart';
import 'package:ith/pages/result_page.dart';
import 'package:easy_localization/easy_localization.dart';

import '../components/value_picker.dart';
import '../components/value_slider.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  bool femaleButtonisActive = true;
  bool maleButtonisActive = false;
  int weight = 70;
  int height = 160;
  int age = 25;

  void switchColor() {
    setState(() {
      femaleButtonisActive = !femaleButtonisActive;
      maleButtonisActive = !maleButtonisActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            CustomAppBar(
              title: 'bmi_calculator'.tr(),
              firstIcon: FontAwesomeIcons.ellipsisVertical,
              secondIcon: FontAwesomeIcons.userLarge,
              onFirstTap: () {},
              onSecondTap: () {},
            ),
            Row(
              children: [
                ShadowButton(
                  isFemale: false,
                  onTap: () {
                    switchColor();
                  },
                  maxWidth: 2,
                  text: 'bmi_male'.tr(),
                  isActive: maleButtonisActive,
                ),
                ShadowButton(
                  isFemale: true,
                  onTap: () {
                    switchColor();
                  },
                  maxWidth: maxWidth,
                  text: 'bmi_female'.tr(),
                  isActive: femaleButtonisActive,
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: ShadowContainer(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                          'btn_lets_begin'.tr(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Expanded(
                          child: ValueSlider(
                        activeColor: maleButtonisActive
                            ? const Color(0xff56CFDB)
                            : const Color(0xffe7c6ff),
                        onChanged: (v) {
                          height = v;
                        },
                      )),
                    ],
                  ))),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                            child: ValuePicker(
                          onChanged: (v) {
                            weight = v;
                          },
                          label: 'bmi_weight'.tr(),
                          initialValue: 70,
                        )),
                        Expanded(
                            child: ValuePicker(
                          onChanged: (v) {
                            age = v;
                          },
                          label: 'bmi_age'.tr(),
                          initialValue: 25,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ShadowContainer(
              child: TextButton(
                onPressed: () {
                  print('bmi_height'.tr() + " : " + height.toString());
                  print('bmi_weight'.tr() + " : " + weight.toString());
                  print('bmi_age'.tr() + ": " + age.toString());
                  double BMI = CalculateBMI.Calculate(
                      height.toDouble(), weight.toDouble());
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => ResultPage(
                                BMI: BMI,
                                isMale: maleButtonisActive,
                              )));
                },
                child: Text(
                  'btn_lets_begin'.tr(),
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                    primary: Colors.black12,
                    splashFactory: NoSplash.splashFactory,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: maleButtonisActive
                        ? const Color(0xff56CFDB)
                        : const Color(0xffe7c6ff),
                    maximumSize: Size(MediaQuery.of(context).size.width, 50),
                    minimumSize: Size(MediaQuery.of(context).size.width, 50)),
              ),
            )
          ])),
    );
  }
}
