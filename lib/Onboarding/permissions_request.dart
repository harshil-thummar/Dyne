import 'package:dyne/Constance/constance.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Responsive/responsive.dart';
import '../Widgets/Navigator/navigator_page.dart';
import '../Widgets/common_button.dart';
import '../main.dart';
import 'launch_screen.dart';

class PermissionsRequest extends StatefulWidget {
  const PermissionsRequest({Key? key}) : super(key: key);

  @override
  State<PermissionsRequest> createState() => _PermissionsRequestState();
}

class _PermissionsRequestState extends State<PermissionsRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding).copyWith(
                  bottom: 0,
                  top: MediaQuery.of(context).padding.top +
                      defaultPadding * 1.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SplashIcon(
                      onPressed: () {
                        Navigator.push(context,
                            SlideRightRoute(widget: const LaunchScreen()));
                      },
                      size: 30,
                      icon: const Icon(Icons.arrow_back_ios_new_outlined,
                          color: Colors.white, size: 30)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.permissionsRequest);
                      },
                      child: Text(
                        "Permissions",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                  const SizedBox(width: defaultPadding * 2),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + defaultPadding * 2),
            child: const ClipperCard(),
          ),
        ],
      ),
    );
  }
}

class ClipperCard extends StatefulWidget {
  const ClipperCard({Key? key}) : super(key: key);

  @override
  State<ClipperCard> createState() => _ClipperCardState();
}

class _ClipperCardState extends State<ClipperCard> {
  int page = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    var pageViewPadding = EdgeInsets.only(
        left: defaultPadding * 1.5,
        right: defaultPadding * 1.5,
        top: MediaQuery.of(context).size.height / defaultPadding * 1.6,
        bottom: MediaQuery.of(context).padding.bottom + defaultPadding);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width /* * 0.8 */,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (Responsive.isMobile(context))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 1.40),
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
                      ],
                    ),
                  if (Responsive.isTablet(context))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 1.40),
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
                      ],
                    ),
                  if (Responsive.isMobile(context))
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (pageNumbe) {
                          setState(() {
                            page = pageNumbe;
                          });
                        },
                        children: [
                          parmissionPageOne(pageViewPadding, context),
                          parmissionPageTow(pageViewPadding, context),
                        ],
                      ),
                    ),
                  if (Responsive.isTablet(context))
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (pageNumbe) {
                          setState(() {
                            page = pageNumbe;
                          });
                        },
                        children: [
                          parmissionPageOne(pageViewPadding, context),
                          parmissionPageTow(pageViewPadding, context),
                        ],
                      ),
                    ),
                  if (Responsive.isDesktop(context))
                    Row(
                      children: [
                        Expanded(
                          child: parmissionPageOne(pageViewPadding, context),
                        ),
                        Expanded(
                          child: parmissionPageTow(pageViewPadding, context),
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding).copyWith(
                        bottom: MediaQuery.of(context).padding.bottom +
                            defaultPadding * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (Responsive.isMobile(context))
                          page == 1
                              ? CustomButton(
                                  responsive: true,
                                  text: "Get Started",
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.singinsingup);
                                  },
                                )
                              : const Text(
                                  "You can change these permissions at any time in your Settings app."),
                        if (Responsive.isTablet(context))
                          page == 1
                              ? CustomButton(
                                  responsive: true,
                                  text: "Get Started",
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.singinsingup);
                                  },
                                )
                              : const Text(
                                  "You can change these permissions at any time in your Settings app."),
                        if (Responsive.isDesktop(context))
                          CustomButton(
                            responsive: true,
                            text: "Get Started",
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.singinsingup);
                            },
                          )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding parmissionPageOne(EdgeInsets pageViewPadding, BuildContext context) {
    return Padding(
      padding: pageViewPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Before you start...",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding - 5),
          Text(
              "We would like to inform you on why we need your data and how we use it.",
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: defaultPadding * 1.5),
          Text("Location",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding - 5),
          Text("We use your location to provide services and features such as:",
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
          Text("Contacts",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: defaultPadding - 5),
          Text("We use your contacts for services and features such as:",
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
          Text("Files",
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
        title: Text(text),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 15.0;
    var path = Path();
    var height = 751.5;

    path.moveTo(0, height * 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, roundnessFactor * 3);
    path.quadraticBezierTo(size.width, roundnessFactor,
        size.width - roundnessFactor * 2, roundnessFactor * 1.4);
    path.lineTo(
        roundnessFactor * 1.3, size.height * 0.10 - roundnessFactor * 0.5);
    path.quadraticBezierTo(
        1, size.height * 0.10, 0, size.height * 0.10 + roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
