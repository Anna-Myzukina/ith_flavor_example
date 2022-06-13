import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ith/constants.dart';
import 'package:ith/helpers/theme_helper.dart';
import 'package:ith/pages/calculate_page.dart';
import 'package:ith/pages/result_page.dart';
import 'package:easy_localization/easy_localization.dart';

enum AppFlavor {english, czech, french}

void startApp(String flavorString) {

  AppFlavor flavor = AppFlavor.english;

  switch (flavorString) {
    case 'english' :
    flavor = AppFlavor.english;
    break;
    case 'czech' :
    flavor = AppFlavor.czech;
    break;
    case 'french' :
    flavor = AppFlavor.french;
    break;

  }

  runApp(
    EasyLocalization(
    path: 'assets/translations',
    supportedLocales: [
      Locale('en', 'EN'),
      Locale('cz', 'CZ'),
      Locale('fr', 'FR')
    ],
    fallbackLocale: Locale('fr', 'FR'),
    child: App(flavor: flavor),
    ),
    );
}

class App extends StatelessWidget {
  const App({Key? key, required AppFlavor flavor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
        localizationsDelegates:
    context.localizationDelegates,
                supportedLocales:
    context.supportedLocales,
    locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeHelper.currentTheme,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case calculatePageId:
            return CupertinoPageRoute(
                builder: (context) => const CalculatePage());

          case resultPageId:
            return CupertinoPageRoute(builder: (context) => const ResultPage());
        }
      },
    );
  }
}
