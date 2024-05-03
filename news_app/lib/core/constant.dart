import 'package:flutter/material.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';

String pngName(String? image) {
  return 'assets/images/$image.png';
}

String jpgName(String? image) {
  return 'assets/images/$image.jpg';
}

String jpegName(String? image) {
  return 'assets/images/$image.jpeg';
}

const width20 = SizedBox(width: 20);
const width10 = SizedBox(width: 10);
const width1 = SizedBox(width: 1);
const heght30 = SizedBox(height: 30);
const heght40 = SizedBox(height: 40);
const heght60 = SizedBox(height: 60);
const heght20 = SizedBox(height: 20);
const heght10 = SizedBox(height: 10);
const heght8 = SizedBox(height: 8.0);
const heght16 = SizedBox(height: 16.0);

const String defaultToken = '19|n8yyGcix0xBHPIiHkQoIpg03GKoMEFLsNr74fB7C';

const defultImage = 'https://badalsale.com/storage/user/default-user.svg';

// void changeLang(context) {
//   translator.setNewLanguage(context,
//       newLanguage: translator.activeLanguageCode == 'ar' ? 'en' : 'ar', remember: true, restart: true);
// }

Text kAddress(address) {
  return Text(
    address,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  );
}
