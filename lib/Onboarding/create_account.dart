// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../Constance/constance.dart';
import '../Language/app_localization.dart';
import '../Models/models.dart';
import '../Responsive/responsive.dart';
import '../Widgets/costome_widget/background_clipper.dart';
import '../Widgets/common_button.dart';
import '../Widgets/costome_widget/costome_circleavatar.dart';
import '../main.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  int page = 0;
  PageController pageController = PageController();

  RecurrenceBottomSheet recurrenceSheet = RecurrenceBottomSheet();

  @override
  Widget build(BuildContext context) {
    String profileImage = ConstanceData.profile;

    var typeBioField = TextFormField(
        maxLines: 6,
        textInputAction: TextInputAction.next,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(defaultPadding * 1.3),
            filled: true,
            hoverColor: Theme.of(context).backgroundColor,
            fillColor: Theme.of(context).backgroundColor,
            hintText: "Type bio here (optional)",
            hintStyle:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
            labelStyle:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 16),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 2))));
    return WillPopScope(
      onWillPop: () async {
        Navigator.canPop(context);
        final snackBar = SnackBar(
          content: const InfiniteText('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {},
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Background Color
            BackgroundClip(
                backgroundWidget: true,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top +
                        AppBar().preferredSize.height * 2)),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              PageView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (pageNumbe) {
                  setState(() {
                    page = pageNumbe;
                  });
                },
                children: [
                  addAccount(context, typeBioField, profileImage),
                  addInterests(context),
                  addBio(context, typeBioField),
                ],
              ),
            if (Responsive.isDesktop(context))
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top +
                              defaultPadding * 8.5),
                      child: AccountClipperCard(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 5.5),
                            Expanded(
                              child: ListView(
                                physics: const RangeMaintainingScrollPhysics(),
                                padding: EdgeInsets.zero,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width /
                                                3.8),
                                    padding: const EdgeInsets.all(
                                        defaultPadding * 1.5),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: CustomField(
                                                          hintText:
                                                              'First Name')),
                                                  const SizedBox(
                                                      width: defaultPadding),
                                                  Expanded(
                                                    child: CustomField(
                                                        hintText: 'Last Name'),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                  height: defaultPadding),
                                              CustomField(hintText: 'Email'),
                                              const SizedBox(
                                                  height: defaultPadding),
                                              CustomField(
                                                  hintText: 'Phone Number'),
                                              const SizedBox(
                                                  height: defaultPadding),
                                              typeBioField
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                            width: defaultPadding * 1.5),
                                        Expanded(
                                          child: Column(
                                            children: [addInterests(context)],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  profileAvtar(context, profileImage),
                ],
              ),
            // Header Icon
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
                          onPressed: () {},
                          size: 30,
                          icon: const Icon(Icons.arrow_back_ios_new_outlined,
                              color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ),
                  InfiniteText("Create Account",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white)),
                  SizedBox(
                    width: defaultPadding * 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (page == 2)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                Responsive.isMobile(context)
                                    ? recurrenceSheet.recurrenceSheet(context)
                                    : successfullyDialog();
                              });
                            },
                            child: InfiniteText(
                              "Skip",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 18, color: Colors.white),
                            ),
                          )
                        else
                          const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(defaultPadding * 1.5).copyWith(
              bottom:
                  MediaQuery.of(context).padding.bottom + defaultPadding * 1.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InfiniteElevatedButton(
                responsive: true,
                text: "Continue",
                onPressed: () {
                  setState(() {
                    if (!Responsive.isDesktop(context) && page < 3) {
                      page++;
                    }
                  });
                  if (page == 1) {
                    pageController.animateToPage(1,
                        curve: Curves.ease, duration: defaultPageDuration);
                  } else if (page == 2) {
                    pageController.animateToPage(2,
                        curve: Curves.ease, duration: defaultPageDuration);
                  } else if (page == 3) {
                    if (Responsive.isMobile(context)) {
                      recurrenceSheet.recurrenceSheet(context);
                    }
                    if (Responsive.isTablet(context)) {
                      successfullyDialog();
                    }
                  }
                  if (Responsive.isDesktop(context)) {
                    successfullyDialog();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ProfileCircleAvatar profileAvtar(BuildContext context, profileImage) {
    return ProfileCircleAvatar(
        shadow: true,
        padding: Responsive.isDesktop(context)
            ? const EdgeInsets.only(top: defaultPadding * 5)
            : EdgeInsets.zero,
        backgroundColor: Colors.white,
        image: AssetImage(profileImage));
  }

  Widget addBio(BuildContext context, TextFormField typeBioField) {
    return Padding(
      padding: Responsive.isTablet(context)
          ? EdgeInsets.only(
              top: MediaQuery.of(context).padding.top +
                  AppBar().preferredSize.height * 3,
              left: MediaQuery.of(context).size.width / 4,
              right: MediaQuery.of(context).size.width / 4)
          : EdgeInsets.only(
              top: MediaQuery.of(context).padding.top +
                  AppBar().preferredSize.height * 3.3,
              left: defaultPadding * 1.5,
              right: defaultPadding * 1.5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height +
                AppBar().preferredSize.height),
        children: [
          InfiniteText("Tell us a bit\nabout yourself",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize: 28)),
          const SizedBox(height: defaultPadding - 5),
          InfiniteText("What do you enjoy?",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 17)),
          const SizedBox(height: defaultPadding * 4),
          typeBioField,
        ],
      ),
    );
  }

  Widget addAccount(BuildContext context, typeBioField, profileImage) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top +
              AppBar().preferredSize.height * 1.5),
      child: Column(
        children: [
          profileAvtar(context, profileImage),
          const SizedBox(height: defaultPadding),
          if (Responsive.isMobile(context) || Responsive.isTablet(context))
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Responsive.isMobile(context)
                            ? defaultPadding * 1.5
                            : MediaQuery.of(context).size.width / 4)
                        .copyWith(
                            top: MediaQuery.of(context).size.width / 10,
                            bottom: defaultPadding * 1.5),
                    child: Column(
                      children: [
                        CustomField(
                          hintText: 'First Name',
                        ),
                        const SizedBox(height: defaultPadding),
                        CustomField(hintText: 'Last Name'),
                        const SizedBox(height: defaultPadding),
                        CustomField(hintText: 'Email'),
                        const SizedBox(height: defaultPadding),
                        CustomField(hintText: 'Phone Number'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget addInterests(BuildContext context) {
    var pcAndTabComman = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfiniteText("What are your\ninterests?",
            style:
                Theme.of(context).textTheme.headline5!.copyWith(fontSize: 28)),
        const SizedBox(height: defaultPadding - 5),
        InfiniteText("Choose up to five (5):",
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17)),
        const SizedBox(height: defaultPadding * 4),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: defaultPadding,
          children: List.generate(interestsList.length, (index) {
            return ChoiceChip(
              backgroundColor: interestsList[index].isSelected
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).primaryColor,
              elevation: 0,
              avatar: Icon(
                  interestsList[index].isSelected ? Icons.add : Icons.done,
                  color: interestsList[index].isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  size: 22),
              padding: const EdgeInsets.symmetric(horizontal: 7),
              shape: StadiumBorder(
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),
              label: InfiniteText(interestsList[index].name.toString(),
                  style: TextStyle(
                      color: interestsList[index].isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.white)),
              selected: interestsList == index,
              selectedColor: Theme.of(context).primaryColor,
              labelStyle: const TextStyle(color: Colors.white),
              onSelected: (isSelected) {
                setState(() {
                  interestsList[index].isSelected =
                      !interestsList[index].isSelected;
                });
              },
            );
          }),
        ),
      ],
    );
    return Column(
      children: [
        if (Responsive.isMobile(context) || Responsive.isTablet(context))
          Padding(
              padding: EdgeInsets.only(
                top: Responsive.isTablet(context)
                    ? MediaQuery.of(context).padding.top +
                        MediaQuery.of(context).size.width / 3.5
                    : MediaQuery.of(context).size.width / 1.6,
                left: defaultPadding * 1.5,
                right: defaultPadding * 1.5,
              ),
              child: pcAndTabComman),
        if (Responsive.isDesktop(context)) pcAndTabComman,
      ],
    );
  }

  void successfullyDialog() => showModal(
        configuration: const FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 300),
            reverseTransitionDuration: Duration(milliseconds: 500)),
        context: context,
        builder: (BuildContext context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: AlertDialog(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: InfiniteText("Account Created\nSuccessfully",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(ConstanceData.happyDyning,
                          height: defaultPadding * 15),
                      CircleAvatar(
                          radius: defaultPadding * 4.5,
                          backgroundColor: Theme.of(context).primaryColor),
                      CircleAvatar(
                          radius: defaultPadding * 4.2,
                          backgroundColor: Theme.of(context).backgroundColor),
                      CircleAvatar(
                          radius: defaultPadding * 4,
                          backgroundColor: Theme.of(context).primaryColor),
                      Center(
                        child: Image.asset(ConstanceData.doneIcon,
                            width: defaultPadding * 4),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: defaultPadding * 1.5),
                InfiniteText("Happy Dyning",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 19, fontWeight: FontWeight.w600)),
                const SizedBox(height: defaultPadding * 1.5),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 6,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.costomeBottomBar);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius))),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    child: InfiniteText("Go to Home",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class RecurrenceBottomSheet {
  recurrenceSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              Navigator.canPop(context);
              showToast("Go to Home");
              return false;
            },
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 7,
                        right: MediaQuery.of(context).size.width / 7,
                        top: MediaQuery.of(context).size.width / 2.4),
                    decoration: BoxDecoration(
                        color:
                            Theme.of(context).backgroundColor.withOpacity(0.8)),
                    child: Column(
                      children: [
                        InfiniteText("Account Created\nSuccessfully",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 2),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(ConstanceData.happyDyning),
                                    CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        backgroundColor:
                                            Theme.of(context).primaryColor),
                                    CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width /
                                                6.8,
                                        backgroundColor:
                                            Theme.of(context).backgroundColor),
                                    CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        backgroundColor:
                                            Theme.of(context).primaryColor),
                                    Center(
                                      child: Image.asset(
                                        ConstanceData.doneIcon,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6.7,
                                      ),
                                    )
                                  ],
                                ))),
                        InfiniteText("Happy Dyning",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 19, fontWeight: FontWeight.w600)),
                        const SizedBox(height: defaultPadding * 2),
                        InfiniteElevatedButton(
                          text: "Go to Home",
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.costomeBottomBar);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
}

class AccountClipperCard extends StatefulWidget {
  Color? color;
  Widget? widget;
  AccountClipperCard({Key? key, this.color, this.widget}) : super(key: key);
  @override
  State<AccountClipperCard> createState() => _AccountClipperCardState();
}

class _AccountClipperCardState extends State<AccountClipperCard> {
  int page = 0;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BackgroundClip(child: widget.widget);
    // Align(
    //   alignment: Alignment.bottomCenter,
    //   child: ClipPath(
    //     clipper: BackgroundClipper(),
    //     child: Container(
    //         width: MediaQuery.of(context).size.width /* * 0.8 */,
    //         height: MediaQuery.of(context).size.height,
    //         decoration: BoxDecoration(
    //             color:
    //                 widget.color ?? Theme.of(context).scaffoldBackgroundColor),
    //         child: ),
    //   ),
    // );
  }
}
