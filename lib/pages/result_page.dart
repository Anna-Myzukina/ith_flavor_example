import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:circular/circular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ith/helpers/calculate_bmi.dart';

import '../components/custom_appbar.dart';
import '../components/shadow_container.dart';

class ResultPage extends StatelessWidget {
  final double? BMI;
  final bool? isMale;
  const ResultPage({this.BMI, this.isMale, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: CustomAppBar(
                  title: 'bmi_result'.tr(),
                  firstIcon: FontAwesomeIcons.arrowLeft,
                  secondIcon: FontAwesomeIcons.userLarge,
                  onFirstTap: () {
                    Navigator.pop(context);
                  },
                  onSecondTap: () {},
                )),
            Expanded(
              flex: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularViewer(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xff9eadb6),
                            offset: Offset(
                              15,
                              15,
                            ),
                            blurRadius: 40.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-2.0, -2.0),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                        ]),
                    value: BMI!,
                    maxValue: 40,
                    radius: 170,
                    textStyle: const TextStyle(fontSize: 45),
                    color: const Color(0xffEEEEEE),
                    sliderColor: isMale!
                        ? const Color(0xff56CFDB)
                        : const Color(0xffe7c6ff),
                    unSelectedColor: const Color(0xffD7DEE7),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      CalculateBMI.getInterpretation(BMI!.toInt()),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            ShadowContainer(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top : 11.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('bmi_info'.tr(),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Text("default 1"),
                                  Text("default 2"),
                              ],
                            ),
                                                      Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Text("default 1"),
                                  Text("default 2"),
                              ],
                            ),
                                                      Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Text("default 1"),
                                  Text("default 2"),
                              ],
                            ),
                                                      Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                 Text("default 1"),
                                  Text("default 2"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                        }
                        ,
                        shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                ),
                 backgroundColor: Color(0xffEEEEEE),
                 );
                  },
                  child: Text(
                    'bmi_details'.tr(),
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.black12,
                    splashFactory: NoSplash.splashFactory,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: const Color(0xffEEEEEE),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
