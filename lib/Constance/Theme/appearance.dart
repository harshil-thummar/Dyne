// // ignore_for_file: deprecated_member_use, library_private_types_in_public_api, must_be_immutable, unrelated_type_equality_checks, unused_local_variable

// import 'package:dyne/Constance/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Responsive/responsive.dart';
// import '../main.dart' as main;
// import 'constance.dart';
// import 'dark_theme_model.dart';

// List<String> navStack = ["Home"];
// int? selectedTheme;
// int? selectedDarkTheme;

// void themedata() async {
//   Brightness brightness;
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   brightness =
//       (prefs.getBool("isDark") ?? false) ? Brightness.dark : Brightness.light;
// }

// class AppearanceScreen extends StatefulWidget {
//   const AppearanceScreen({Key? key}) : super(key: key);

//   @override
//   State<AppearanceScreen> createState() => _AppearanceScreenState();
// }

// class _AppearanceScreenState extends State<AppearanceScreen> {
//   Color? selectedAccentColor;
//   Color? selectedDarkAccentColor;
//   late bool changingLight;
//   Future<bool> onWillPop() async {
//     if (navStack.length > 1) navStack.removeLast();
//     return true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: onWillPop,
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (Responsive.isMobile(context)) const InfiniteText("Mobile"),
//               if (Responsive.isTablet(context)) const InfiniteText("Tablet"),
//               if (Responsive.isDesktop(context)) const InfiniteText("Desktop"),
//             ],
//           ),
//           onPressed: () {
//             themeDialog(context);
//             // pageController.animateToPage(1,
//             //     curve: Curves.ease, duration: defaultPageDuration);
//           },
//         ),
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           actions: <Widget>[
//             IconButton(
//                 icon: Icon(
//                   Icons.done,
//                   size: 30,
//                   color: Theme.of(context).accentColor,
//                 ),
//                 onPressed: () {
//                   final accentColor = int.parse(selectedAccentColor
//                       .toString()
//                       .replaceAll("MaterialColor(primary value: Color(0xff", "")
//                       .replaceAll("Color(", "")
//                       .replaceAll(")", ""));
//                   main.prefs.put("systemOverlayColor", accentColor);

//                   navStack.removeLast();

//                   Navigator.pop(context);
//                 })
//           ],
//           elevation: 0,
//           title: Row(
//             children: [
//               InfiniteText(
//                 "Theme Manager",
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline5!
//                     .copyWith(color: Theme.of(context).accentColor),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 3, bottom: 5),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).errorColor,
//                     borderRadius: BorderRadius.circular(500)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
//                   child: InfiniteText(
//                     "BETA",
//                     style: TextStyle(
//                       fontSize: 9,
//                       color: Theme.of(context).accentColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             ListTile(
//               onTap: () {
//                 showModalBottomSheet(
//                   isScrollControlled: true,
//                   context: context,
//                   builder: (context) => PreferencePanel(
//                     selectedValue: AppTheme.isLightTheme == Brightness.light
//                         ? 1
//                         : AppTheme.isLightTheme == Brightness.dark
//                             ? 2
//                             : 0,
//                     func: (bool value) {
//                       setState(() {
//                         changingLight = value;
//                       });
//                     },
//                   ),
//                 );
//               },
//               leading: const Icon(Icons.brightness_1_rounded),
//               title: InfiniteText(
//                 "Theme Preference",
//                 style: TextStyle(
//                     color: Theme.of(context).accentColor,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Proxima Nova"),
//               ),
//               subtitle: const InfiniteText(
//                 "text",
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).dividerColor,
//                   borderRadius: BorderRadius.circular(17),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(.15),
//                       blurRadius: 38,
//                       offset: const Offset(0, 19),
//                     ),
//                     BoxShadow(
//                       color: Colors.black.withOpacity(.10),
//                       blurRadius: 12,
//                       offset: const Offset(0, 15),
//                     )
//                   ],
//                 ),
//                 width: MediaQuery.of(context).size.height * 0.45 * 0.4993924666,
//                 height: MediaQuery.of(context).size.height * 0.45,
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(17),
//                     child: const InfiniteText("data")),
//               ),
//             ),
//             const Divider(),
//             if (AppTheme.isLightTheme)
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: InfiniteText(
//                   "Light Themes",
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               )
//             else
//               Container(),
//             if (AppTheme.isLightTheme)
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 1,
//                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: MaterialButton(
//                           color: Theme.of(context).hintColor,
//                           padding: EdgeInsets.zero,
//                           onPressed: () {
//                             // Provider.of<ThemeModel>(context, listen: false)
//                             //     .changeThemeByID(themes.keys.toList()[index]);
//                             // logger.d(selectedAccentColor.toString());
//                             // setState(() {
//                             //   changingLight = true;
//                             //   selectedTheme = index;
//                             //   selectedAccentColor = Color(int.parse(Provider.of<
//                             //           ThemeModel>(context, listen: false)
//                             //       .currentTheme!
//                             //       .errorColor
//                             //       .toString()
//                             //       .replaceAll(
//                             //           "MaterialColor(primary value: Color(0xff",
//                             //           "")
//                             //       .replaceAll("Color(", "")
//                             //       .replaceAll(")", "")));
//                             // });
//                             // logger.d(selectedAccentColor.toString());
//                           },
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.3,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.06,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.black12),
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.red),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: const [
//                                     Padding(
//                                       padding: EdgeInsets.all(4.0),
//                                       child: InfiniteText("fvbcvb"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               if (index == selectedTheme)
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.3,
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.06,
//                                   decoration: BoxDecoration(
//                                       color: Theme.of(context)
//                                           .accentColor
//                                           .withOpacity(0.5),
//                                       border: Border.all(color: Colors.black45),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.check,
//                                         color: Theme.of(context).primaryColor,
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               else
//                                 Container(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               )
//             else
//               Container(),
//             if (AppTheme.isLightTheme)
//               Container()
//             else
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: InfiniteText(
//                   "Dark Themes",
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ),
//             if (AppTheme.isLightTheme)
//               Container()
//             else
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.07,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 1,
//                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: MaterialButton(
//                           color: Theme.of(context).hintColor,
//                           padding: EdgeInsets.zero,
//                           onPressed: () {
//                             // Provider.of<DarkThemeModel>(context, listen: false)
//                             //     .changeThemeByID(
//                             //         darkThemes.keys.toList()[index]);
//                             // logger.d(selectedDarkAccentColor.toString());
//                             // setState(() {
//                             //   changingLight = false;
//                             //   selectedDarkTheme = index;
//                             //   selectedDarkAccentColor = Color(int.parse(Provider
//                             //           .of<DarkThemeModel>(context,
//                             //               listen: false)
//                             //       .currentTheme!
//                             //       .errorColor
//                             //       .toString()
//                             //       .replaceAll(
//                             //           "MaterialColor(primary value: Color(0xff",
//                             //           "")
//                             //       .replaceAll("Color(", "")
//                             //       .replaceAll(")", "")));
//                             // });
//                             // logger.d(selectedDarkAccentColor.toString());
//                           },
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width * 0.3,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.06,
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.black12),
//                                     borderRadius: BorderRadius.circular(10),
//                                     color: Colors.blue),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(4.0),
//                                       child: InfiniteText(
//                                         "Material Dark",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .subtitle2!
//                                             .copyWith(
//                                               color: Colors.green,
//                                             ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               if (index == selectedDarkTheme)
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.3,
//                                   height:
//                                       MediaQuery.of(context).size.height * 0.06,
//                                   decoration: BoxDecoration(
//                                       color: Theme.of(context)
//                                           .accentColor
//                                           .withOpacity(0.5),
//                                       border: Border.all(color: Colors.black45),
//                                       borderRadius: BorderRadius.circular(10)),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.check,
//                                         color: Theme.of(context).primaryColor,
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               else
//                                 Container(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             const Divider(),
//             AppTheme.isLightTheme
//                 ? Container(
//                     width: MediaQuery.of(context).size.width,
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: InfiniteText(
//                       "Light Accent Color",
//                       style: Theme.of(context).textTheme.headline4,
//                     ),
//                   )
//                 : Container(),
//             if (AppTheme.isLightTheme)
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.055,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: ConstanceData().colors.length,
//                   padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         // setState(() {
//                         //   changingLight = true;
//                         //   selectedAccentColor = colors[index];
//                         // });
//                         // Provider.of<ThemeModel>(context, listen: false)
//                         //     .changeAccent(selectedAccentColor);
//                       },
//                       child: Stack(
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: selectedAccentColor ==
//                                         ConstanceData().colors[index]
//                                     ? Colors.white
//                                     : Colors.white38,
//                               ),
//                               color: ConstanceData().colors[index],
//                               shape: BoxShape.circle,
//                             ),
//                             child: const SizedBox(
//                               width: 41,
//                               height: 41,
//                             ),
//                           ),
//                           if (selectedAccentColor ==
//                               ConstanceData().colors[index])
//                             Container(
//                               margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
//                               decoration: BoxDecoration(
//                                 color: Theme.of(context)
//                                     .accentColor
//                                     .withOpacity(0.6),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: SizedBox(
//                                 width: 41,
//                                 height: 41,
//                                 child: Icon(
//                                   Icons.check,
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                               ),
//                             )
//                           else
//                             Container(),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               )
//             else
//               Container(),
//             if (AppTheme.isLightTheme)
//               Container()
//             else
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: InfiniteText(
//                   "Dark Accent Color",
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//               ),
//             if (AppTheme.isLightTheme)
//               Container()
//             else
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.055,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: ConstanceData().colors.length,
//                   padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           changingLight = false;
//                           selectedDarkAccentColor =
//                               ConstanceData().colors[index];
//                         });
//                         Provider.of<DarkThemeModel>(context, listen: false)
//                             .changeAccent(selectedDarkAccentColor);
//                       },
//                       child: Stack(
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     color: selectedDarkAccentColor ==
//                                             ConstanceData().colors[index]
//                                         ? Colors.white
//                                         : Colors.white38),
//                                 color: ConstanceData().colors[index],
//                                 shape: BoxShape.circle),
//                             child: const SizedBox(width: 41, height: 41),
//                           ),
//                           if (selectedDarkAccentColor ==
//                               ConstanceData().colors[index])
//                             Container(
//                               margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
//                               decoration: BoxDecoration(
//                                 color: Theme.of(context)
//                                     .accentColor
//                                     .withOpacity(0.6),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: SizedBox(
//                                 width: 41,
//                                 height: 41,
//                                 child: Icon(
//                                   Icons.check,
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                               ),
//                             )
//                           else
//                             Container(),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PreferencePanel extends StatefulWidget {
//   int? selectedValue;
//   final Function(bool value)? func;
//   PreferencePanel({
//     Key? key,
//     this.selectedValue,
//     this.func,
//   }) : super(key: key);

//   @override
//   _PreferencePanelState createState() => _PreferencePanelState();
// }

// class _PreferencePanelState extends State<PreferencePanel> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width * 0.85;
//     return Container(
//       height: MediaQuery.of(context).size.height / 2 > 400
//           ? MediaQuery.of(context).size.height / 2
//           : 400,
//       decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(0), topRight: Radius.circular(0))),
//       child: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   height: 5,
//                   width: 30,
//                   decoration: BoxDecoration(
//                       color: Theme.of(context).hintColor,
//                       borderRadius: BorderRadius.circular(500)),
//                 ),
//               ),
//             ],
//           ),
//           const Spacer(),
//           InfiniteText("Theme Preference",
//               style: Theme.of(context).textTheme.headline5),
//           const Spacer(flex: 2),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       widget.selectedValue = 0;
//                     });
//                     Navigator.pop(context);
//                     themedata();
//                     widget.func!(Brightness.light == "Light");
//                   },
//                   child: SizedBox(
//                     width: width - 20,
//                     height: 60,
//                     child: Container(
//                       width: width - 14,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         color: widget.selectedValue != 0
//                             ? Theme.of(context).accentColor.withOpacity(0.2)
//                             : Theme.of(context).errorColor.withOpacity(0.2),
//                         border: Border.all(
//                             color: widget.selectedValue != 0
//                                 ? Theme.of(context).accentColor
//                                 : Theme.of(context).errorColor,
//                             width: 3),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: InfiniteText(
//                           "System",
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).accentColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       widget.selectedValue = 1;
//                     });
//                     Navigator.pop(context);
//                     changeColor(context, light);
//                     widget.func!(true);
//                   },
//                   child: SizedBox(
//                     width: width - 20,
//                     height: 60,
//                     child: Container(
//                       width: width - 14,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         color: widget.selectedValue != 1
//                             ? Theme.of(context).accentColor.withOpacity(0.2)
//                             : Theme.of(context).errorColor.withOpacity(0.2),
//                         border: Border.all(
//                             color: widget.selectedValue != 1
//                                 ? Theme.of(context).accentColor
//                                 : Theme.of(context).errorColor,
//                             width: 3),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: InfiniteText(
//                           "Light",
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).accentColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       widget.selectedValue = 2;
//                     });
//                     Navigator.pop(context);
//                     changeColor(context, dark);
//                     widget.func!(false);
//                   },
//                   child: SizedBox(
//                     width: width - 20,
//                     height: 60,
//                     child: Container(
//                       width: width - 14,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         color: widget.selectedValue != 2
//                             ? Theme.of(context).accentColor.withOpacity(0.2)
//                             : Theme.of(context).errorColor.withOpacity(0.2),
//                         border: Border.all(
//                             color: widget.selectedValue != 2
//                                 ? Theme.of(context).accentColor
//                                 : Theme.of(context).errorColor,
//                             width: 3),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Center(
//                         child: InfiniteText(
//                           "Dark",
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).accentColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Spacer(flex: 2),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width * 0.8,
//               child: InfiniteText(
//                 "Select your preferred theme mode. System mode automatically switches between light and dark depending on your device mode.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 13, color: Theme.of(context).accentColor),
//               ),
//             ),
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }
