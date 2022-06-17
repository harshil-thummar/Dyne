// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/common_button.dart';
import '../main.dart';
import 'constance.dart';

class AppTheme {
  static bool isLightTheme = false;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      subtitle1: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.subtitle1!.color, fontSize: 15)),
      subtitle2: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.caption!.color,
              fontSize: 15,
              fontWeight: FontWeight.w500)),
      bodyText1: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.bodyText1!.color, fontSize: 14)),
      bodyText2: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.bodyText2!.color, fontSize: 16)),
      button: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.button!.color,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      //Normale TextStyle headline1
      headline1: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.subtitle1!.color,
              fontSize: 15,
              fontWeight: FontWeight.w500)),
      caption: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.caption!.color, fontSize: 12)),
      headline4: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.headline4!.color, fontSize: 24)),
      headline3: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.headline3!.color,
              fontSize: 40,
              fontWeight: FontWeight.w600)),
      headline2: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.headline2!.color, fontSize: 60)),
      headline5: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.headline5!.color,
              fontSize: 24,
              fontWeight: FontWeight.w600)),
      headline6: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.headline6!.color,
              fontSize: 20,
              fontWeight: FontWeight.w500)),
      overline: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.overline!.color, fontSize: 10)),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = primaryColorString;
    Color secondaryColor = secondaryColorString;
    final ColorScheme colorScheme = ColorScheme.light()
        .copyWith(primary: primaryColor, secondary: secondaryColor);

    final ThemeData base = ThemeData.light();
    return base.copyWith(
        appBarTheme: AppBarTheme(color: Colors.white),
        popupMenuTheme: PopupMenuThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Color(0xff2b2b2b)),
        colorScheme: colorScheme,
        primaryColor: primaryColor,
        buttonColor: primaryColor,
        shadowColor: Color(0xffD5D7D8),
        splashColor: Colors.white.withOpacity(0.1),
        hoverColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        accentColor: primaryColor,
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        errorColor: Colors.red,
        cursorColor: primaryColor,
        textTheme: _buildTextTheme(base.textTheme),
        primaryTextTheme: _buildTextTheme(base.textTheme),
        platform: TargetPlatform.iOS,
        indicatorColor: primaryColor,
        disabledColor: Color(0xffD5D7D8));
  }

  static ThemeData darkTheme() {
    Color primaryColor = primaryColorString;
    Color secondaryColor = secondaryColorString;
    final ColorScheme colorScheme = ColorScheme.dark()
        .copyWith(primary: primaryColor, secondary: secondaryColor);
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
        appBarTheme: AppBarTheme(color: Colors.grey[700]),
        popupMenuTheme: PopupMenuThemeData(color: Colors.black),
        colorScheme: colorScheme,
        iconTheme: IconThemeData(color: Colors.white),
        shadowColor: Colors.white12,
        primaryColor: primaryColor,
        buttonColor: primaryColor,
        indicatorColor: Colors.white,
        splashColor: Colors.white24,
        splashFactory: InkRipple.splashFactory,
        accentColor: secondaryColor,
        canvasColor: Colors.grey[900],
        // backgroundColor: Colors.grey[800],
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        buttonTheme: ButtonThemeData(
            colorScheme: colorScheme, textTheme: ButtonTextTheme.primary),
        cursorColor: primaryColor,
        textTheme: _buildTextTheme(base.textTheme),
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
        accentTextTheme: _buildTextTheme(base.accentTextTheme),
        platform: TargetPlatform.iOS);
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

int light = 1;
int dark = 2;
bool selectFirstColor = true;
bool selectSecondColor = false;
bool selectThirdColor = false;
bool selectFourthColor = false;
bool selectFifthColor = false;
bool selectSixthColor = false;

changeColor(BuildContext context, int color) {
  if (color == light) {
    MyApp.setCustomeTheme(context, 6);
  } else {
    MyApp.setCustomeTheme(context, 7);
  }
}

void themeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        buttonPadding: EdgeInsets.all(5),
        titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 5),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Primary Color"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              onTap: () {
                selectfirstColor(context);
              },
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFFF453A),
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: !selectFirstColor
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xFFFF453A),
                        )
                      : SizedBox(),
                ),
              ),
              title: Text(
                "Red",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              onTap: () {
                selectsecondColor(context);
              },
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xffFF9F0A),
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: selectSecondColor
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xffFF9F0A),
                        )
                      : SizedBox(),
                ),
              ),
              title: Text(
                "Orange",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              onTap: () {
                selectthirdColor(context);
              },
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFFFD60A),
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: selectThirdColor
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xFFFFD60A),
                        )
                      : SizedBox(),
                ),
              ),
              title: Text(
                "Yellow",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              onTap: () {
                selectfourthColor(context);
              },
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFF4C4CFF),
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: selectFourthColor
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xFF4C4CFF),
                        )
                      : SizedBox(),
                ),
              ),
              title: Text(
                "Blue",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              onTap: () {
                selectfifthColor(context);
              },
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFB323BA),
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: selectFifthColor
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xFFB323BA),
                        )
                      : SizedBox(),
                ),
              ),
              title: Text(
                "Purple",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(35, 0, 0, 0),
              onTap: () {
                selectsixthColor(context);
              },
              leading: CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFEB1165),
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: selectSixthColor
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xFFEB1165),
                        )
                      : SizedBox(),
                ),
              ),
              title: Text(
                "Pink",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            FlutterSwitch(
              height: 22.0,
              width: 33,
              padding: 3.0,
              toggleSize: 15.0,
              activeColor: AppTheme.isLightTheme
                  ? AppTheme.isLightTheme
                      ? Colors.white
                      : Colors.white70
                  : Colors.white70,
              toggleColor: AppTheme.isLightTheme
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).scaffoldBackgroundColor,
              inactiveToggleColor: AppTheme.isLightTheme
                  ? Theme.of(context).primaryColor.withOpacity(0.8)
                  : Theme.of(context).scaffoldBackgroundColor,
              inactiveColor: AppTheme.isLightTheme
                  ? Colors.white60
                  : Colors.grey.withOpacity(0.7),
              borderRadius: defaultRadius,
              value: status,
              onToggle: (val) {
                // setState(() {
                status = val;
                // });
                if (status == true) {
                  changeColor(context, dark);
                } else {
                  changeColor(context, light);
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

selectfirstColor(BuildContext context) {
  if (selectFirstColor) {
    selectFirstColor = false;
    selectSecondColor = false;
    selectThirdColor = false;
    selectFourthColor = false;
    selectFifthColor = false;
    selectSixthColor = false;

    MyApp.setCustomeTheme(context, 0);
  }
}

selectsecondColor(BuildContext context) {
  if (!selectSecondColor) {
    selectFirstColor = true;
    selectSecondColor = true;
    selectThirdColor = false;
    selectFourthColor = false;
    selectFifthColor = false;
    selectSixthColor = false;

    MyApp.setCustomeTheme(context, 1);
  }
}

selectthirdColor(BuildContext context) {
  if (!selectThirdColor) {
    selectFirstColor = true;
    selectSecondColor = false;
    selectThirdColor = true;
    selectFourthColor = false;
    selectFifthColor = false;
    selectSixthColor = false;
  }
  MyApp.setCustomeTheme(context, 2);
}

selectfourthColor(BuildContext context) {
  if (!selectFourthColor) {
    selectFirstColor = true;
    selectSecondColor = false;
    selectThirdColor = false;
    selectFourthColor = true;
    selectFifthColor = false;
    selectSixthColor = false;
  }
  MyApp.setCustomeTheme(context, 3);
}

selectfifthColor(BuildContext context) {
  if (!selectFifthColor) {
    selectFirstColor = true;
    selectSecondColor = false;
    selectThirdColor = false;
    selectFourthColor = false;
    selectFifthColor = true;
    selectSixthColor = false;
  }
  MyApp.setCustomeTheme(context, 4);
}

selectsixthColor(BuildContext context) {
  if (!selectSixthColor) {
    selectFirstColor = true;
    selectSecondColor = false;
    selectThirdColor = false;
    selectFourthColor = false;
    selectFifthColor = false;
    selectSixthColor = true;
  }
  MyApp.setCustomeTheme(context, 5);
}
