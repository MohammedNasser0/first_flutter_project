import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ImageText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mainpage.title".tr()),
        //Change Language
        leading: TextButton(
          onPressed: () {
            if (context.locale.languageCode == 'en') {
              context.setLocale(Locale("ar", "EG"));
            } else if (context.locale.languageCode == 'ar') {
              context.setLocale(Locale("en", "US"));
            }
          },
          child: Text("mainpage.langCode".tr()),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset("assets/images/image.jpg", width: 200, height: 200),
              SizedBox(width: 10),
              Image.network(
                "https://i.pinimg.com/1200x/41/44/3d/41443d4ff583d50f989d09838671bf11.jpg",
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "mainpage.imagesDisplayed".tr(),
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Suwannaphum-Regular",
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              child: Text(
                "mainpage.signup".tr(),
                style: TextStyle(color: Colors.redAccent),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, "SignUpPage");
              },
            ),
          ),
        ],
      ),
    );
  }
}
