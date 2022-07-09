import 'package:dyne/Constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Language/app_localization.dart';
import '../Responsive/responsive.dart';
import '../Widgets/Navigator/navigator_page.dart';
import '../Widgets/costome_widget/background_clipper.dart';
import '../Widgets/common_button.dart';
import '../main.dart';
import 'launch_screen.dart';

class PermissionsRequest extends StatefulWidget {
  const PermissionsRequest({Key? key}) : super(key: key);

  @override
  State<PermissionsRequest> createState() => _PermissionsRequestState();
}
// Map<Permission, PermissionStatus> status = await [
//       Permission.location,
//       Permission.contacts,
//       Permission.storage
//     ].request();

class _PermissionsRequestState extends State<PermissionsRequest> {
  ///////////////////////////

  //PermissionStatus locationStatus =
  //     await Permission.location.request();
  // if (locationStatus == PermissionStatus.granted) {}
  // if (locationStatus == PermissionStatus.denied) {
  //   showToast("This permission is recommended");
  // }
  // if (locationStatus ==
  //     PermissionStatus.permanentlyDenied) {
  //   openAppSettings();
  // }

  bool locationStatus = false;
  bool contactsStatus = false;
  bool storageStatus = false;
  bool detectPermission = false;
  @override
  void initState() {
    checkLocationPermission();

    // checkContactPermission();
    // checkStoragePermission();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && detectPermission) {
      detectPermission = false;
      checkLocationPermission();
    } else if (state == AppLifecycleState.paused) {
      detectPermission = true;
    }
  }

  Future checkLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      setState(() {
        locationStatus = true;
      });
    } else if (await Permission.location.request().isPermanentlyDenied) {
      await showToast("location required");
    } else if (await Permission.location.request().isDenied) {
      setState(() {
        locationStatus = false;
      });
    }
    if (await Permission.contacts.request().isGranted) {
      setState(() {
        contactsStatus = true;
      });
    } else if (await Permission.contacts.request().isPermanentlyDenied) {
      await showToast("contact required");
    } else if (await Permission.contacts.request().isDenied) {
      setState(() {
        contactsStatus = false;
      });
    }
    if (await Permission.storage.request().isGranted) {
      setState(() {
        storageStatus = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await showToast("storage required");
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        storageStatus = false;
      });
    }
  }

  //////////////////////////////////////////////////////////
  // Future<bool> checkPermission() async {
  //   Map<Permission, PermissionStatus> status = await [
  //     Permission.location,
  //     Permission.contacts,
  //     Permission.storage
  //   ].request();

  //   if (status == PermissionStatus.granted) {
  //     setState(() {
  //       locationStatus = true;
  //     });
  //     return true;
  //   } else {
  //     showToast("loc open Setting");
  //   }

  //   if (status[1] != PermissionStatus.granted) {
  //     setState(() {
  //       contactsStatus = true;
  //     });
  //     return true;
  //   } else {
  //     showToast("con open Setting");
  //   }

  //   if (status[2] != PermissionStatus.granted) {
  //     setState(() {
  //       storageStatus = true;
  //     });
  //     return true;
  //   } else {
  //     showToast("stg open Setting");
  //   }
  //   return false;
  // }

/* 
     //locationResult
  Future<bool> checkLocationPermission() async {
    PermissionStatus locationResult;
    locationResult = await Permission.location.request();
    if (locationResult == PermissionStatus.granted) {
      setState(() {
        locationStatus = true;
      });
      return true;
    } else {
      showToast("open Setting");
    }
    return false;
  }

    //contactsResult
  Future<bool> checkContactPermission() async {
    PermissionStatus contactsResult;
    contactsResult = await Permission.contacts.request();
    if (contactsResult.isGranted) {
      setState(() {
        contactsStatus = true;
      });
      return true;
    } else {
      showToast("open Setting");
    }
    return false;
  }

    //storageResult
  Future<bool> checkStoragePermission() async {
    PermissionStatus storageResult;
    storageResult = await Permission.storage.request();
    if (storageResult.isGranted) {
      setState(() {
        storageStatus = true;
      });
      return true;
    } else {
      showToast("open Setting");
    }
    return false;
  }
 */
  ///////////////////////////
  int page = 0;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    var pageViewPadding = EdgeInsets.only(
        left: defaultPadding * 1.5,
        right: defaultPadding * 1.5,
        top: AppBar().preferredSize.height * 1.4,
        bottom: MediaQuery.of(context).padding.bottom + defaultPadding);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundClip(
            backgroundWidget: true,
            padding: EdgeInsets.only(top: AppBar().preferredSize.height * 1.3),
            color: Theme.of(context).scaffoldBackgroundColor,
            getClipSize: 600,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Indicator (Mobile & Tablet)
                if (!Responsive.isDesktop(context))
                  Column(
                    children: [
                      const Spacer(flex: 13),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        effect: WormEffect(
                          spacing: 15,
                          dotWidth: 14,
                          dotHeight: 14,
                          paintStyle: PaintingStyle.fill,
                          dotColor: Theme.of(context).dividerColor,
                          strokeWidth: 1,
                          activeDotColor: const Color(0xff717171),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                // Main Body (Mobile & Tablet)
                if (!Responsive.isDesktop(context))
                  PageView(
                    controller: controller,
                    onPageChanged: (pageNumbe) {
                      setState(() {
                        page = pageNumbe;
                      });
                    },
                    children: [
                      SingleChildScrollView(
                          child: parmissionPageOne(pageViewPadding, context)),
                      SingleChildScrollView(
                          child: parmissionPageTow(pageViewPadding, context)),
                    ],
                  ),
                // Main Body (Desktop Only)
                if (Responsive.isDesktop(context))
                  Row(
                    children: [
                      Expanded(
                          child: parmissionPageOne(pageViewPadding, context)),
                      Expanded(
                          child: parmissionPageTow(pageViewPadding, context)),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding).copyWith(
                top: MediaQuery.of(context).padding.top + defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: defaultPadding * 3,
                  child: Row(
                    children: [
                      SplashIcon(
                          onPressed: () {
                            Navigator.push(context,
                                SlideRightRoute(widget: const LaunchScreen()));
                          },
                          size: 30,
                          icon: const Icon(Icons.arrow_back_ios_new_outlined,
                              color: Colors.white, size: 28)),
                    ],
                  ),
                ),
                InfiniteText("Permissions",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white)),
                SizedBox(
                    width: defaultPadding * 3,
                    child: SplashIcon(
                        onPressed: locationStatus == true &&
                                contactsStatus == true &&
                                storageStatus == true
                            ? () {
                                didChangeAppLifecycleState(
                                    AppLifecycleState.resumed);
                                checkLocationPermission();
                                debugPrint("print");
                              }
                            : () {
                                openAppSettings();
                                didChangeAppLifecycleState(
                                    AppLifecycleState.resumed);
                              },
                        icon: const Icon(Icons.settings,
                            size: 26, color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(defaultPadding).copyWith(
            bottom: MediaQuery.of(context).padding.bottom + defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterSwitch(
                    height: 22.0,
                    width: 33,
                    padding: 3.0,
                    toggleSize: 15.0,
                    borderRadius: defaultRadius,
                    value: locationStatus,
                    onToggle: (_) {}),
                FlutterSwitch(
                    height: 22.0,
                    width: 33,
                    padding: 3.0,
                    toggleSize: 15.0,
                    borderRadius: defaultRadius,
                    value: contactsStatus,
                    onToggle: (_) {}),
                FlutterSwitch(
                    height: 22.0,
                    width: 33,
                    padding: 3.0,
                    toggleSize: 15.0,
                    borderRadius: defaultRadius,
                    value: storageStatus,
                    onToggle: (_) {}),
              ],
            ),
            locationStatus == true &&
                    contactsStatus == true &&
                    storageStatus == true
                ? bottomBarButton(context)
                : SizedBox(
                    height: InfiniteElevatedButton(
                      onPressed: () {},
                    ).height,
                    child: const InfiniteText(
                        "You can change these permissions at any time in your Settings app."),
                  ),
          ],
        ),
      ),
      /*  bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(defaultPadding).copyWith(
            bottom: MediaQuery.of(context).padding.bottom + defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfiniteElevatedButton(
                    responsive: true,
                    text: "All",
                    onPressed: () async {
                      initState();
                      debugPrint(status.toString());
                    }),
                InfiniteElevatedButton(
                    responsive: true,
                    text: locationStatus ? "Loca.on" : "Loca.off",
                    onPressed: () {}),
                InfiniteElevatedButton(
                    responsive: true,
                    text: contactsStatus ? "Cont.on" : "Cont.off",
                    onPressed: () {}),
                InfiniteElevatedButton(
                    responsive: true,
                    text: storageStatus ? "strg.on" : "strg.off",
                    onPressed: () {}),
              ],
            )
          ],
        ),
      ), */
    );
  }

  InfiniteElevatedButton bottomBarButton(BuildContext context) {
    return InfiniteElevatedButton(
      responsive: true,
      text: "Get Started",
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.singinsingup);
      },
    );
  }

  Padding parmissionPageOne(EdgeInsets pageViewPadding, BuildContext context) {
    return Padding(
      padding: pageViewPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfiniteText("Before you start...",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding - 5),
          InfiniteText(
              "We would like to inform you on why we need your data and how we use it.",
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: defaultPadding * 1.5),
          InfiniteText("Location",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding - 5),
          InfiniteText(
              "We use your location to provide services and features such as:",
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: defaultPadding * 1.5),
          permissionsDetail(
              image: ConstanceData.face,
              context: context,
              text: 'Alerts when your friends are near your location.'),
          permissionsDetail(
              image: ConstanceData.compass,
              context: context,
              text:
                  'You will receive personalized recommendations to nearby restaurants.'),
          permissionsDetail(
              image: ConstanceData.location,
              context: context,
              text:
                  'Share your location with other Dyne users to easily schedule meetups.'),
          permissionsDetail(
              image: ConstanceData.busCar,
              context: context,
              text:
                  'Use the integrated GPS to navigate to your meetup location.'),
        ],
      ),
    );
  }

  Padding parmissionPageTow(EdgeInsets pageViewPadding, BuildContext context) {
    return Padding(
      padding: pageViewPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfiniteText("Contacts",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding - 5),
          InfiniteText(
              "We use your contacts for services and features such as:",
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: defaultPadding * 2),
          permissionsDetail(
              image: ConstanceData.chorasProfile,
              context: context,
              text: 'Alerts when your friends are near your location.'),
          permissionsDetail(
              image: ConstanceData.groupIcon,
              context: context,
              text:
                  'You will receive personalized recommendations to nearby restaurants.'),
          const SizedBox(height: defaultPadding * 2),
          InfiniteText("Files",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding - 5),
          permissionsDetail(
              image: ConstanceData.circleProfile,
              context: context,
              text:
                  'Completing your profile so that other users can identify you.'),
          permissionsDetail(
              image: ConstanceData.uPin,
              context: context,
              text:
                  'Attaching media messages within group chats and direct messages.'),
        ],
      ),
    );
  }

  Widget permissionsDetail(
      {required String image,
      required String text,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: ListTile(
        leading: SizedBox(
            width: defaultPadding * 3.2,
            child: Image.asset(
              image,
              alignment: Alignment.center,
              height: 35,
              color: Theme.of(context).primaryColor,
            )),
        title: InfiniteText(text),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
