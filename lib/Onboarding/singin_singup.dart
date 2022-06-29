import 'package:dyne/Constance/theme.dart';
import 'package:flutter/material.dart';
import '../Constance/constance.dart';
import '../Language/app_localization.dart';
import '../Responsive/responsive.dart';
import '../main.dart';

class SingInSingUp extends StatefulWidget {
  const SingInSingUp({Key? key}) : super(key: key);

  @override
  State<SingInSingUp> createState() => _SingInSingUpState();
}

class _SingInSingUpState extends State<SingInSingUp> {
  @override
  Widget build(BuildContext context) {
    String dyneNewLogoImage = ConstanceData.dyneNewLogo;
    return Scaffold(
      body: Column(
        children: [
          if (Responsive.isMobile(context))
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding).copyWith(
                    bottom:
                        MediaQuery.of(context).padding.bottom + defaultPadding,
                    top: MediaQuery.of(context).padding.top + defaultPadding),
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(dyneNewLogoImage,
                        height: MediaQuery.of(context).size.width / 1.6),
                    const Spacer(),
                    InfiniteText("Welcome to Dyne",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontSize: 27),
                        textAlign: TextAlign.center),
                    const InfiniteText(
                        "We use your files for services and features such as:"),
                    const Spacer(),
                    commonButtonsThisPage(context),
                  ],
                ),
              ),
            ),
          if (!Responsive.isMobile(context))
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding * 1.5).copyWith(
                    bottom:
                        MediaQuery.of(context).padding.bottom + defaultPadding,
                    top: MediaQuery.of(context).padding.top + defaultPadding),
                child: Column(
                  children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: defaultPadding * 0),
                                          child: Image.asset(dyneNewLogoImage,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                          ),
                                          child: const InfiniteText(
                                              "We use your files for services and features such as:")),
                                      if (Responsive.isTablet(context))
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  12),
                                          child: commonButtonsThisPage(context),
                                        ),
                                      if (Responsive.isDesktop(context))
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8),
                                          child: commonButtonsThisPage(context),
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
            ),
        ],
      ),
    );
  }

  Column commonButtonsThisPage(BuildContext context) {
    return Column(
      children: [
        commonButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.createAccount);
            },
            image: ConstanceData.googleIcon,
            text: "Sign in with Google"),
        const SizedBox(height: defaultPadding),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            boxShadow: AppTheme.isLightTheme
                ? null
                : [
                    BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 1,
                        spreadRadius: 1.5),
                  ],
          ),
          child: commonButton(
              onPressed: () {},
              image: ConstanceData.appleIcon,
              containerColor: Colors.black,
              text: "Sign in with Apple"),
        ),
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
