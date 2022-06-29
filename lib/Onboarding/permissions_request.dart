import 'package:dyne/Constance/constance.dart';
import 'package:flutter/material.dart';
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

class _PermissionsRequestState extends State<PermissionsRequest> {
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
            padding: EdgeInsets.only(top: AppBar().preferredSize.height * 1.2),
            color: Theme.of(context).scaffoldBackgroundColor,
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
                      parmissionPageOne(pageViewPadding, context),
                      parmissionPageTow(pageViewPadding, context),
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
                              color: Colors.white, size: 30)),
                    ],
                  ),
                ),
                InfiniteText("Permissions",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white)),
                const SizedBox(width: defaultPadding * 3),
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
            if (!Responsive.isDesktop(context))
              page == 1
                  ? bottomBarButton(context)
                  : SizedBox(
                      height: InfiniteElevatedButton(
                        onPressed: () {},
                      ).height,
                      child: const InfiniteText(
                          "You can change these permissions at any time in your Settings app."),
                    ),
            if (Responsive.isDesktop(context)) bottomBarButton(context)
          ],
        ),
      ),
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
