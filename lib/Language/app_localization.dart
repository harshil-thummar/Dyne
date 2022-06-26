import 'language_data.dart';
import 'package:flutter/material.dart';

class InfiniteText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  const InfiniteText(
    this.text, {
    Key? key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(text),
      key: key,
      style: style,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}

String locale = "en";
AllTextData? allTextData;

class AppLocalizations {
  static String of(String text, {String ignoreLanguageCode = 'en'}) {
    String myLocale = locale;

    if (allTextData != null && allTextData!.allText!.isNotEmpty) {
      var newtext = '';
      int index =
          allTextData!.allText!.indexWhere((note) => note.textId == text);
      if (index != -1) {
        if (myLocale == 'fr') {
          newtext = allTextData!.allText![index].fr;
        } else if (myLocale == 'ar') {
          newtext = allTextData!.allText![index].ar;
        } else if (myLocale == 'en') {
          newtext = allTextData!.allText![index].en;
        } else if (myLocale == 'ja') {
          newtext = allTextData!.allText![index].ja;
        }
        if (newtext != '') {
          return newtext;
        } else {
          return text;
        }
      } else {
        return text;
      }
    } else {
      return text;
    }
  }
}
