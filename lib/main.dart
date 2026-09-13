import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/screens/imagetext.dart';
import 'package:first_flutter_project/screens/shoppingscreen.dart';
import 'package:first_flutter_project/screens/signuppage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale("en-US"),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        "Shoppingscreen": (context) => const Shoppingscreen(),
        "SignUpPage": (context) => const SignUpPage(),
        "ImageText": (context) => ImageText(),
      },
      home: ImageText(),
      debugShowCheckedModeBanner: false,
    );
  }
}
