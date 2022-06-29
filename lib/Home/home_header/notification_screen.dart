import 'package:flutter/material.dart';

import '../../Constance/constance.dart';
import '../../Language/app_localization.dart';
import '../../Widgets/costome_widget/background_clipper.dart';
import '../../Widgets/common_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          //Title
          Padding(
            padding: const EdgeInsets.all(defaultPadding)
                .copyWith(top: MediaQuery.of(context).padding.top),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SplashIcon(
                    onPressed: () {},
                    size: 30,
                    icon: const Icon(Icons.arrow_back_ios_new_outlined,
                        color: Colors.white, size: 30)),
                InfiniteText("Create Account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white)),
                const SizedBox(width: defaultPadding * 1.5)
              ],
            ),
          ),
          //Path Container
          BackgroundClip(
            backgroundWidget: true,
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
          ),
          //Body
          Container(
            color: Colors.white10,
            child: Row(
              children: const [CircleAvatar()],
            ),
          )
        ],
      ),
    );
  }
}
