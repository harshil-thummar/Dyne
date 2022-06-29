// ignore_for_file: unrelated_type_equality_checks

import 'dart:math';

import 'package:flutter/material.dart';

import '../Constance/constance.dart';
import '../Constance/data_config.dart';
import '../Constance/theme.dart';
import '../Language/app_localization.dart';
import '../Models/models.dart';
import '../Widgets/costome_widget/background_clipper.dart';
import '../Widgets/common_button.dart';
import '../Widgets/costome_widget/costome_circleavatar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  bool statusBarColorChange = true;
  bool showTopButton = false;
  late TabController tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollPixelLimit();
    // showGoTopButton();
  }

  void scrollPixelLimit() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (scrollController.offset <= 75) {
            statusBarColorChange = true;
          } else {
            statusBarColorChange = false;
          }
        });
      });
  }

  void showGoTopButton() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (scrollController.offset >= 450) {
            showTopButton = true; // show the Button
          } else {
            showTopButton = false; // hide the Button
          }
        });
      });
  }

  void scrollGoTop() {
    scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutQuint);
  }

  @override
  void dispose() {
    // dispose the controller
    scrollController.dispose();

    super.dispose();
  }

  List<Tab> profileTab = [
    const Tab(text: 'Past Meetups'),
    const Tab(text: 'Upcoming Meetups'),
  ];
  double randomMinutes({double min = 01.0, double max = 00.0}) {
    double randomMinutes = min + Random().nextDouble() * (min + max);
    return randomMinutes;
  }

  int randomHours({int min = 1, int max = 6}) {
    int randomHours = min + Random().nextInt(max - min);
    return randomHours;
  }

  int randomDate({int min = 1, int max = 30}) {
    int randomDate = min + Random().nextInt(max - min);
    return randomDate;
  }

  int orderTime({int min = 1, int max = 6}) {
    int randomOrderTime = min + Random().nextInt(max - min);
    return randomOrderTime;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height / 5 / 10;
    var weekNameList = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final weekList = (weekNameList..shuffle()).first;
    var monthsNameList = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    final monthList = (monthsNameList..shuffle()).first;
    var timeCategoryList = ["PM", "AM"];
    final timeCategory = (timeCategoryList..shuffle()).first;
    final minuteslist = List.generate(
        1, (_) => randomMinutes(min: 0.00, max: 59.0).toStringAsFixed(0));
    final hoursList = List.generate(1, (_) => randomHours(min: 01, max: 12));
    final dateList = List.generate(1, (_) => randomDate(min: 01, max: 30));
    final orderTimeList = List.generate(1, (_) => orderTime(min: 01, max: 59));
    tabController = TabController(length: 2, vsync: this);

    return Semantics(
        container: true,
        child: AnimatedContainer(
          color: statusBarColorChange
              ? Theme.of(context).primaryColor
              : Theme.of(context).scaffoldBackgroundColor,
          duration: const Duration(milliseconds: 200),
          child: SafeArea(
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: showTopButton
                  ? FloatingActionButton(
                      mini: true,
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.7),
                      onPressed: () {
                        scrollGoTop();
                      },
                      child:
                          const Icon(Icons.arrow_upward, color: Colors.white),
                    )
                  : null,
              body: Scrollbar(
                controller: scrollController,
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      key: UniqueKey(),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          //Background Color
                          BackgroundClip(
                              backgroundWidget: true,
                              getClipSize: 600,
                              containerHeight:
                                  MediaQuery.of(context).size.height / 2,
                              padding: EdgeInsets.only(
                                  top: AppBar().preferredSize.height)),
                          //Icons
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SplashIcon(
                                    onPressed: () {},
                                    size: 32,
                                    icon: Image.asset(
                                        ConstanceData.profileEditIcon,
                                        color: Colors.white,
                                        height: 23)),
                                SplashIcon(
                                  onPressed: () {},
                                  size: 31,
                                  icon: Image.asset(ConstanceData.more3Icon,
                                      color: Colors.white, height: 17),
                                ),
                              ],
                            ),
                          ),
                          //Data
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProfileCircleAvatar(
                                  shadow: true,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).padding.top,
                                      bottom: screenHeight),
                                  image: const NetworkImage(
                                      'https://www.google.com/maps/uv?pb=!1s0x3be0456a49d66ce5:0x1440baa58aadc609!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipMch9mtyD12KDnHPjIDIcs2O6E7FzsxdFHEOaIw%3Dw160-h160-k-no!5sharshil+thummar+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipMch9mtyD12KDnHPjIDIcs2O6E7FzsxdFHEOaIw&hl=en&sa=X&ved=2ahUKEwiR8uTN6bvvAhXoILcAHWvRBKUQoiowE3oECCEQAw')),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        InfiniteText("Harshil Thummar",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(fontSize: 17)),
                                        InfiniteText("Vancouver, BC, Canada",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(fontSize: 17)),
                                      ],
                                    ),
                                    Container(
                                      height: 50,
                                      margin: EdgeInsets.symmetric(
                                          vertical: screenHeight),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          dividerData(
                                              context: context,
                                              digits: 12,
                                              txt: "Meetups",
                                              image: ConstanceData.spunIcon),
                                          VerticalDivider(
                                              thickness: 2,
                                              color: Theme.of(context)
                                                  .dividerColor),
                                          dividerData(
                                              context: context,
                                              digits: 240,
                                              txt: "Dyne Bucks",
                                              image: ConstanceData
                                                  .flatuiMoneyIcon),
                                          VerticalDivider(
                                              thickness: 2,
                                              color: Theme.of(context)
                                                  .dividerColor),
                                          dividerData(
                                              context: context,
                                              digits: 289,
                                              txt: "Friends",
                                              image:
                                                  ConstanceData.miniGroupIcon),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                8),
                                        child: InfiniteText(
                                            "Big fan of software and smooties, looking to meet new friends who want to try new things.",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2!
                                                .copyWith(fontSize: 17))),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight,
                                          bottom: defaultPadding / 1.5),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: InfiniteText(
                                          "Interests",
                                          textAlign: TextAlign.left,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(fontSize: 17),
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: defaultPadding,
                                      children: List.generate(4, (index) {
                                        return Chip(
                                          backgroundColor:
                                              Theme.of(context).backgroundColor,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 7),
                                          shape: StadiumBorder(
                                              side: BorderSide(
                                                  color: AppTheme.isLightTheme
                                                      ? Colors.black54
                                                      : Colors.white70)),
                                          labelPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal:
                                                      defaultPadding / 1.5),
                                          label: InfiniteText(
                                              interestsList[index]
                                                  .name
                                                  .toString()),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: MyCustomHeader(
                            expandedHeight: kToolbarHeight,
                            tabs: TabBar(
                                splashBorderRadius: const BorderRadius.vertical(
                                    bottom: Radius.circular(defaultRadius * 2)),
                                indicatorPadding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 1.5),
                                controller: tabController,
                                tabs: profileTab))),
                    /*    SliverFillRemaining(
                      // hasScrollBody: false,
                      // fillOverscroll: true,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            // padding: EdgeInsets.zero,
                            children: List.generate(
                              10,
                              (index) => Container(
                                padding: const EdgeInsets.all(3),
                                margin: const EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius * 2),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0.0, 5.5),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                        color: Theme.of(context).shadowColor),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius * 2),
                                        child: Image.asset(
                                            ConstanceData.restaurant_0,
                                            fit: BoxFit.cover)),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                          defaultPadding / 1.6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons
                                                          .calendar_month_rounded),
                                                      SizedBox(
                                                          width:
                                                              defaultPadding),
                                                      // for (var index = 0;
                                                      //     index < 1;
                                                      //     index++)
                                                      //   InfiniteText(
                                                      //       "$weekList ${dateList[index]} $monthList"),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: const [
                                                      Icon(Icons.alarm),
                                                      SizedBox(
                                                          width:
                                                              defaultPadding),
                                                      // for (var index = 0;
                                                      //     index < 1;
                                                      //     index++)
                                                      //   Text(
                                                      //       "${orderTimeList[index]} min ${hoursList[index]}:${minuteslist[index]} $timeCategory"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: List.generate(4,
                                                        (index) {
                                                      return Align(
                                                        widthFactor: 0.1,
                                                        child: CircleAvatar(
                                                          radius: 21,
                                                          backgroundColor: Theme
                                                                  .of(context)
                                                              .backgroundColor,
                                                          child: CircleAvatar(
                                                            radius: 20,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    friendListData[
                                                                            index]
                                                                        .image),
                                                          ),
                                                        ),
                                                      );
                                                    })),
                                                for (var index = 0;
                                                    index < 1;
                                                    index++)
                                                  Text(
                                                      "${friendListData[3].name} and "
                                                      "${friendListData.length - 1} "
                                                      "others"),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Center(child: Text("I'm 2"))
                        ],
                      ),
                    ) */
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, int index) {
                          return Container(
                            padding: const EdgeInsets.all(3),
                            margin: const EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius * 2),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0.0, 5.5),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                    color: Theme.of(context).shadowColor),
                              ],
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        defaultRadius * 2),
                                    child: Image.asset(
                                        ConstanceData.restaurant_0,
                                        fit: BoxFit.cover)),
                                Padding(
                                  padding: const EdgeInsets.all(
                                      defaultPadding / 1.6),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(Icons
                                                      .calendar_month_rounded),
                                                  const SizedBox(
                                                      width: defaultPadding),
                                                  for (var index = 0;
                                                      index < 1;
                                                      index++)
                                                    InfiniteText(
                                                        "$weekList ${dateList[index]} $monthList"),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(Icons.alarm),
                                                  const SizedBox(
                                                      width: defaultPadding),
                                                  for (var index = 0;
                                                      index < 1;
                                                      index++)
                                                    Text(
                                                        "${orderTimeList[index]} min ${hoursList[index]}:${minuteslist[index]} $timeCategory"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children:
                                                    List.generate(4, (index) {
                                                  return Align(
                                                    widthFactor: 0.1,
                                                    child: CircleAvatar(
                                                      radius: 21,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .backgroundColor,
                                                      child: CircleAvatar(
                                                        radius: 20,
                                                        backgroundImage:
                                                            AssetImage(
                                                                friendListData[
                                                                        index]
                                                                    .image),
                                                      ),
                                                    ),
                                                  );
                                                })),
                                            for (var index = 0;
                                                index < 1;
                                                index++)
                                              Text(
                                                  "${friendListData[3].name} and "
                                                  "${friendListData.length - 1} "
                                                  "others"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

Widget dividerData(
    {required BuildContext context,
    int digits = 0,
    String txt = "none",
    String image = ""}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InfiniteText(digits.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 17)),
            const SizedBox(width: defaultPadding / 2),
            Image.asset(image, height: 19)
          ],
        ),
        InfiniteText(txt,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16)),
      ],
    ),
  );
}
