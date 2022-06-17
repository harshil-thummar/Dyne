// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../Constance/constance.dart';
import '../Constance/theme.dart';
import '../Models/models.dart';
import '../Responsive/responsive.dart';
import '../Widgets/auto_size_text.dart';
import '../Widgets/common_button.dart';
import '../main.dart';
import 'permissions_request.dart';

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
          content: const Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // if (Navigator.canPop(context)) {
        //   //Navigator.pop(context);
        //   Navigator.of(context).pop();
        // } else {
        //   SystemNavigator.pop();
        // }
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Responsive.isMobile(context)) const Text("Mobile"),
              if (Responsive.isTablet(context)) const Text("Tablet"),
              if (Responsive.isDesktop(context)) const Text("Desktop"),
            ],
          ),
          onPressed: () {
            themeDialog(context);
            // pageController.animateToPage(1,
            //     curve: Curves.ease, duration: defaultPageDuration);
          },
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 2,
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
                        onPressed: () {},
                        size: 30,
                        icon: const Icon(Icons.arrow_back_ios_new_outlined,
                            color: Colors.white, size: 30)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.createAccount);
                        },
                        child: Text("Create Account",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white))),
                    SizedBox(
                      width: defaultPadding * 3,
                      child: Row(
                        children: [
                          page == 2
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.permissionsRequest);
                                  },
                                  child: Text("Skip",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(
                                              fontSize: 18,
                                              color: Colors.white)))
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (Responsive.isMobile(context) || Responsive.isTablet(context))
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top +
                              defaultPadding * 6.5),
                      child: IgnorePointer(child: AccountClipperCard())),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (pageNumbe) {
                        setState(() {
                          page = pageNumbe;
                        });
                      },
                      children: [
                        addAccount(context, typeBioField),
                        addInterests(context),
                        addBio(context, typeBioField),
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 11),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 10,
                            backgroundColor: Colors.white),
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 10.1,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor),
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 10.9,
                            backgroundColor: Colors.white),
                        CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 11,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(ConstanceData.profile)),
                      ],
                    ),
                  ),
                ],
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
              CustomButton(
                responsive: true,
                text: "Continue",
                onPressed: () {
                  setState(() {
                    if (Responsive.isMobile(context) && page < 3 ||
                        Responsive.isTablet(context) && page < 3) {
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

  Widget addBio(BuildContext context, TextFormField typeBioField) {
    return ListView(
      padding: Responsive.isTablet(context)
          ? EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 3.5,
              left: MediaQuery.of(context).size.width / 4,
              right: MediaQuery.of(context).size.width / 4)
          : EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 1.6,
              left: defaultPadding * 1.5,
              right: defaultPadding * 1.5),
      children: [
        Text("Tell us a bit\nabout yourself",
            style:
                Theme.of(context).textTheme.headline5!.copyWith(fontSize: 28)),
        const SizedBox(height: defaultPadding - 5),
        Text("What do you enjoy?",
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17)),
        const SizedBox(height: defaultPadding * 4),
        typeBioField,
      ],
    );
  }

  Widget addAccount(BuildContext context, typeBioField) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + defaultPadding * 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Theme.of(context).shadowColor.withOpacity(0.4),
                    spreadRadius: 2,
                    offset: const Offset(0.0, 3.0)),
              ],
            ),
            child: Column(
              children: [
                if (Responsive.isMobile(context))
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6,
                          backgroundColor: Colors.white),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6.1,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6.9,
                          backgroundColor: Colors.white),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 7,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(ConstanceData.profile)),
                    ],
                  ),
                if (Responsive.isTablet(context))
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 9,
                          backgroundColor: Colors.white),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 9.1,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 9.9,
                          backgroundColor: Colors.white),
                      CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 10,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(ConstanceData.profile)),
                    ],
                  ),
              ],
            ),
          ),
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
                        CustomField(hintText: 'First Name'),
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

  void successfullyDialog() => showModal(
        configuration: const FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 300),
            reverseTransitionDuration: Duration(milliseconds: 500)),
        context: context,
        builder: (BuildContext context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text("Account Created\nSuccessfully",
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
                Text("Happy Dyning",
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
                          context, Routes.launchScreen);
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(defaultRadius))),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor)),
                    child: AutoSizeText("Go to Home",
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

  Widget addInterests(BuildContext context) {
    var pcAndTabComman = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("What are your\ninterests?",
            style:
                Theme.of(context).textTheme.headline5!.copyWith(fontSize: 28)),
        const SizedBox(height: defaultPadding - 5),
        Text("Choose up to five (5):",
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
              label: Text(interestsList[index].name.toString(),
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
                        Text("Account Created\nSuccessfully",
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
                        Text("Happy Dyning",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 19, fontWeight: FontWeight.w600)),
                        const SizedBox(height: defaultPadding * 2),
                        CustomButton(
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
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BackgroundClipper(),
        child: Container(
            width: MediaQuery.of(context).size.width /* * 0.8 */,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color:
                    widget.color ?? Theme.of(context).scaffoldBackgroundColor),
            child: widget.widget),
      ),
    );
  }
}
