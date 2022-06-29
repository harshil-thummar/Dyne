// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Constance/constance.dart';
import '../Language/app_localization.dart';
import '../Responsive/responsive.dart';
import '../Widgets/Navigator/navigator_page.dart';
import '../Widgets/common_button.dart';
import '../main.dart';
import 'launch_screen.dart';

int introductionPageIndex = 0;

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var customButton = InfiniteElevatedButton(
      responsive: true,
      text: "Next",
      onPressed: () {
        setState(() {
          if (introductionPageIndex < 3) {
            introductionPageIndex++;
          }
        });
        if (introductionPageIndex == 1) {
          pageController.animateToPage(1,
              curve: Curves.ease, duration: defaultPageDuration);
        } else if (introductionPageIndex == 2) {
          pageController.animateToPage(2,
              curve: Curves.ease, duration: defaultPageDuration);
        } else if (introductionPageIndex == 3) {
          Navigator.pushReplacementNamed(context, Routes.permissionsRequest);
        }
      },
    );
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const Spacer(flex: 4),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
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
              const Spacer(flex: 2),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (pageNumbe) {
                    setState(() {
                      introductionPageIndex = pageNumbe;
                    });
                  },
                  children: [
                    pagePopup(
                        assetsImage: ConstanceData.welcome1,
                        titleText: 'Meet People With Similar Interests',
                        subText: 'Explore New Restaurants And Cuisines!'),
                    pagePopup(
                        assetsImage: ConstanceData.welcome2,
                        titleText: 'Earn Coupons with Every Meetup',
                        subText:
                            'Get Amazing Discounts and Offers And Save Money'),
                    pagePopup(
                        assetsImage: ConstanceData.welcome3,
                        titleText: 'Grow Your Social Circle',
                        subText:
                            'Get Instant Universal Updates about New Social Challenges and Discounts'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                defaultPadding,
                MediaQuery.of(context).padding.top + defaultPadding,
                defaultPadding,
                MediaQuery.of(context).padding.bottom + defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SplashIcon(
                        onPressed: () {
                          Navigator.push(context,
                              SlideRightRoute(widget: const LaunchScreen()));
                        },
                        size: 30,
                        icon: const Icon(Icons.arrow_back_ios_new_outlined,
                            size: 30)),
                    introductionPageIndex != 2
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.permissionsRequest);
                            },
                            child: const InfiniteText("Skip"))
                        : const SizedBox(),
                  ],
                ),
                if (Responsive.isMobile(context))
                  introductionPageIndex == 2
                      ? InfiniteElevatedButton(
                          responsive: true,
                          text: "Next",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.permissionsRequest);
                          },
                        )
                      : const SizedBox(),
                if (Responsive.isTablet(context)) customButton,
                if (Responsive.isDesktop(context)) customButton
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pagePopup({
    required String assetsImage,
    required String titleText,
    required String subText,
  }) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: AppBar().preferredSize.height),
            height: MediaQuery.of(context).size.height / 1.8,
            child: Image.asset(
              assetsImage,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const Spacer(flex: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: <Widget>[
              InfiniteText(
                titleText,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: defaultPadding),
              InfiniteText(
                subText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
        const Spacer(flex: 13),
      ],
    );
  }
}
