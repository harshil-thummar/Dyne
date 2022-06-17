import 'package:dyne/Constance/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const defaultRadius = 10.0;
const defaultPadding = 15.0;
const bottomBarSize = 60;
const defaultPageDuration = Duration(milliseconds: 500);
const disabledColor = Color(0xff8F9BB3);
const onlineStatusColor = Color(0xff27FF3D);
bool status = AppTheme.isLightTheme ? false : true;
bool shimmerEnable = true;

showToast(String? message) => Fluttertoast.showToast(
    msg: message.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 10,
    textColor: Colors.white,
    fontSize: 16.0);

class ConstanceData {
  static String bseImageUrl = 'assets/images/';
  static String dyneNewLogo = "${bseImageUrl}DYNE new logo 1.png";
  static String welcome1 = "${bseImageUrl}welcome-1.png";
  static String welcome2 = "${bseImageUrl}welcome-2.png";
  static String welcome3 = "${bseImageUrl}welcome-3.png";
  static String happyDyning = "${bseImageUrl}happy_dyning.png";
  static String friend_0 = "${bseImageUrl}friend_0.png";
  static String friend_1 = "${bseImageUrl}friend_1.png";
  static String friend_2 = "${bseImageUrl}friend_2.png";
  static String friend_3 = "${bseImageUrl}friend_3.png";
  static String friend_4 = "${bseImageUrl}friend_4.png";
  static String offer_0 = "${bseImageUrl}offer_0.png";
  static String offer_1 = "${bseImageUrl}offer_1.png";
  static String restaurant_0 = "${bseImageUrl}restaurant_0.png";
  static String restaurant_1 = "${bseImageUrl}restaurant_1.png";
  static String cuisines_0 = "${bseImageUrl}cuisines_0.png";
  static String cuisines_1 = "${bseImageUrl}cuisines_1.png";
  static String cuisines_2 = "${bseImageUrl}cuisines_2.png";
  static String fioreTextLogo = "${bseImageUrl}fiore_textLogo.png";
  static String theRiseLogo = "${bseImageUrl}The-Rise_Logo 1.png";

  ////////////////////////////////////////////
  static String bseIconUrl = 'assets/icons/';
  static String appleIcon = "${bseIconUrl}apple-icon.png";
  static String busCar = "${bseIconUrl}bus_car.png";
  static String chorasProfile = "${bseIconUrl}choras_profile.png";
  static String circleProfile = "${bseIconUrl}circle_profile.png";
  static String compass = "${bseIconUrl}compass.png";
  static String face = "${bseIconUrl}face.png";
  static String facebookIcon = "${bseIconUrl}facebook-icon.png";
  static String googleIcon = "${bseIconUrl}google-icon.png";
  static String groupIcon = "${bseIconUrl}group.png";
  static String location = "${bseIconUrl}location.png";
  static String uPin = "${bseIconUrl}u-pin.png";
  static String profile = "${bseIconUrl}profile.png";
  static String doneIcon = "${bseIconUrl}done_icon.png";
  static String exploreIcon = "${bseIconUrl}Explore.png";
  static String radarIcon = "${bseIconUrl}Radar.png";
  static String couponsIcon = "${bseIconUrl}Coupons.png";
  static String profileIcon = "${bseIconUrl}Profile-mini.png";
  static String notificationIcon = "${bseIconUrl}notification_icon.png";
  static String messIcon = "${bseIconUrl}mess_icon.png";
  static String searchIcon = "${bseIconUrl}search_icon.png";
  static String more3Icon = "${bseIconUrl}more_3-Lines_icon.png";
  static String profileEditIcon = "${bseIconUrl}profile_edit_icon.png";
  static String miniGroupIcon = "${bseIconUrl}group_icon.png";
  static String spunIcon = "${bseIconUrl}spun_icon.png";
  static String flatuiMoneyIcon = "${bseIconUrl}flatui_money_icon.png";

  ////////////////////////////////////////////

  static String bseJsonUrl = "assets/jsonImage/";
  static String animatedLoding = "${bseJsonUrl}animatedLoding.json";

  // List<String> colors = [
  //   '#FF453A',
  //   '#FF9F0A',
  //   '#FFD60A',
  //   '#32D74B',
  //   '#64D2FF',
  //   '#0A84FF',
  //   '#5E5CE6',
  //   '#BF5AF2',
  //   '#FF2D55'
  // ];

  List<Color> colors = [
    const Color(0xFFE57697),
    const Color(0xFFFF0000),
    const Color(0xFFF44436),
    const Color(0xFFe91e63),
    const Color(0xFF9c27b0),
    const Color(0xFF673ab7),
    const Color(0xFF0000FF),
    const Color(0xFF1976D2),
    const Color(0xFF03a9f4),
    const Color(0xFF00bcd4),
    const Color(0xFF009688),
    const Color(0xFF4caf50),
    const Color(0xFF00FF00),
    const Color(0xFF8bc34a),
    const Color(0xFFcddc39),
    const Color(0xFFffeb3b),
    const Color(0xFFffc107),
    const Color(0xFFff9800),
    const Color(0xFFff5722),
    const Color(0xFF795548),
    const Color(0xFF9e9e9e),
    const Color(0xFF607d8b),
  ];
}

int colorsIndex = 0;

var primaryColorString = const Color(0xffCB4044);
var secondaryColorString = const Color(0xffBFBFBF);
