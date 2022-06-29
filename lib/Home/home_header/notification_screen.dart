import 'package:flutter/material.dart';

import '../../Constance/constance.dart';
import '../../Language/app_localization.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/costome_widget/background_clipper.dart';
import '../../Widgets/costome_widget/costome_circleavatar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ScrollController scrollController = ScrollController();
  bool showTopButton = false;

  @override
  void initState() {
    super.initState();
    showGoTopButton();
  }

  void showGoTopButton() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (scrollController.offset >= 300) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: showTopButton
          ? FloatingActionButton(
              mini: true,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
              onPressed: () {
                scrollGoTop();
              },
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          //Path Container
          BackgroundClip(
              backgroundWidget: true,
              padding:
                  EdgeInsets.only(top: AppBar().preferredSize.height * 1.5),
              child: Stack(
                children: [
                  ListView(
                    controller: scrollController,
                    padding: EdgeInsets.only(
                        top: AppBar().preferredSize.height * 1.9),
                    children: [
                      Container(
                        height: 100,
                        color: Colors.amberAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.redAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.blueAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.cyanAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.greenAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.orangeAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.pinkAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.amberAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.redAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.blueAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.cyanAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.greenAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.orangeAccent,
                      ),
                      Container(
                        height: 100,
                        color: Colors.pinkAccent,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Theme.of(context).scaffoldBackgroundColor,
                                Theme.of(context).scaffoldBackgroundColor,
                                Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withAlpha(5),
                              ],
                            ),
                          ))
                    ],
                  ),
                ],
              )),
          // IconCircleAvatar
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding * 3)
                .copyWith(top: AppBar().preferredSize.height * 1.9),
            child: Row(
              children: [
                IconCircleAvatar(
                  image: Icon(Icons.notifications,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 40),
                ),
              ],
            ),
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        size: 30,
                        icon: const Icon(Icons.arrow_back_ios_new_outlined,
                            color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ),
                InfiniteText("Notifications",
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
    );
  }
}
