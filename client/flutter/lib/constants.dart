import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Constants {
  static Color backgroundColor = Color(0xffffffff);
  static Color primaryColor = Color(0xff0093CE);
  static Color textColor = Color(0xffffffff);
}

// Return a scaling factor between 0.0 and 1.0 for screens heights ranging
// from a fixed short to tall range.
double contentScale(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  const tall = 896.0;
  const short = 480.0;
  return ((height - short) / (tall - short)).clamp(0.0, 1.0);
}

const imageExtensions = ["jpg", "jpeg", "png", "gif"];

String i18nAsset(BuildContext context, String name, String extension) {
  var dirName = imageExtensions.contains(extension)
      ? "image" : extension;

  var locale = Localizations.localeOf(context);
  var lang = locale.languageCode;
  var country = locale.countryCode;

  var pathPrefix = 'assets/${dirName}/${name}_${lang}';

  var path = '${pathPrefix}_${country}.${extension}';

  // TODO: Cascade when the country component isn't provided
  /*
  if(/* resource doesn't exist */) {
    path = '${pathPrefix}.${extension}';
  }
  */

  return path;
}
