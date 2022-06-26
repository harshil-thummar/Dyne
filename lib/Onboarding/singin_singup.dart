import 'package:flutter/material.dart';
import '../Constance/constance.dart';
import '../Language/app_localization.dart';
import '../Responsive/responsive.dart';
import '../Widgets/Navigator/navigator_page.dart';
import '../Widgets/common_button.dart';
import '../main.dart';
import 'launch_screen.dart';

class SingInSingUp extends StatefulWidget {
  const SingInSingUp({Key? key}) : super(key: key);

  @override
  State<SingInSingUp> createState() => _SingInSingUpState();
}

class _SingInSingUpState extends State<SingInSingUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.all(defaultPadding * 1.5).copyWith(
                  bottom:
                      MediaQuery.of(context).padding.bottom + defaultPadding,
                  top: MediaQuery.of(context).padding.top + defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
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
                              size: 30)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height / 18),
                          child: Image.asset(ConstanceData.dyneNewLogo,
                              height: MediaQuery.of(context).size.width / 1.6)),
                      InfiniteText("Welcome to Dyne",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontSize: 27),
                          textAlign: TextAlign.center),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height / 10,
                              top: MediaQuery.of(context).size.height / 40),
                          child: const InfiniteText(
                              "We use your files for services and features such as:")),
                    ],
                  ),
                  loginButtons(context),
                ],
              ),
            ),
          if (Responsive.isTablet(context)) tabletAndDesktopCommon(context),
          if (Responsive.isDesktop(context)) tabletAndDesktopCommon(context),
        ],
      ),
    );
  }

  Expanded tabletAndDesktopCommon(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * 1.5).copyWith(
            bottom: MediaQuery.of(context).padding.bottom + defaultPadding,
            top: MediaQuery.of(context).padding.top + defaultPadding),
        child: Column(
          children: [
            Row(
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
                        size: 30)),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: defaultPadding * 2),
                                  child: Image.asset(ConstanceData.dyneNewLogo,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3)),
                              InfiniteText("Welcome to Dyne",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(fontSize: 27),
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        )),
                        Expanded(
                            child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                                  child: const InfiniteText(
                                      "We use your files for services and features such as:")),
                              if (Responsive.isTablet(context))
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                              12),
                                  child: loginButtons(context),
                                ),
                              if (Responsive.isDesktop(context))
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width /
                                              8),
                                  child: loginButtons(context),
                                ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column loginButtons(BuildContext context) {
    return Column(
      children: [
        commonButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.createAccount);
            },
            image: ConstanceData.googleIcon,
            text: "Sign in with Google"),
        const SizedBox(height: defaultPadding),
        commonButton(
            onPressed: () {},
            image: ConstanceData.appleIcon,
            containerColor: Colors.black,
            text: "Sign in with Apple"),
        const SizedBox(height: defaultPadding),
        commonButton(
            onPressed: () {},
            image: ConstanceData.facebookIcon,
            containerColor: const Color(0xff4267B2),
            text: "Sign in with Facebook"),
      ],
    );
  }

  Widget commonButton({
    required String text,
    IconData? icon,
    required String image,
    required VoidCallback onPressed,
    final Color? containerColor,
  }) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultRadius)),
            ),
            backgroundColor: MaterialStateProperty.all(containerColor)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 50,
                width: defaultPadding * 2,
                child: Image.asset(
                  image,
                  height: 30,
                )),
            InfiniteText(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 18, color: Colors.white),
            ),
            const SizedBox()
          ],
        ));
  }
}
