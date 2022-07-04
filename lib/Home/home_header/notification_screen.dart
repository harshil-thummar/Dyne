import 'package:flutter/material.dart';

import '../../Constance/constance.dart';
import '../../Language/app_localization.dart';
import '../../Widgets/common_button.dart';
import '../../Widgets/costome_widget/background_clipper.dart';
import '../../Widgets/costome_widget/costome_circleavatar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    final List<String> items =
        List<String>.generate(30, (i) => "User ${i + 1}");
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: showTopButton
          ? FloatingActionButton(
              mini: true,
              backgroundColor: Theme.of(context).primaryColor,
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
                  ListView.builder(
                      controller: scrollController,
                      itemCount: items.length,
                      padding: EdgeInsets.only(
                          top: AppBar().preferredSize.height * 1.9),
                      itemBuilder: (context, int index) {
                        return Slidable(
                            actionPane: const SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            actions: <Widget>[
                              IconSlideAction(
                                caption: 'Archive',
                                color: Colors.blue,
                                icon: Icons.archive,
                                onTap: () => (context) => () {},
                              ),
                            ],
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () => (context) => () {},
                              ),
                            ],
                            child: ListTile(
                                title: Text(
                                    "${items[index]} requested a meetup")));
                      }),
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
