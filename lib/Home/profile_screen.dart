import 'package:flutter/material.dart';

import '../Constance/constance.dart';
import '../Constance/data_config.dart';
import '../Onboarding/permissions_request.dart';
import '../Widgets/common_button.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding).copyWith(
                bottom: 0,
                top: MediaQuery.of(context).padding.top + defaultPadding * 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SplashIcon(
                    onPressed: () {},
                    size: 32,
                    icon: Image.asset(ConstanceData.profileEditIcon,
                        color: Colors.white, height: 23)),
                SplashIcon(
                    onPressed: () {},
                    size: 31,
                    icon: Image.asset(ConstanceData.more3Icon,
                        color: Colors.white, height: 17)),
              ],
            ),
          ),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: AppBar().preferredSize.height),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                        clipper: BackgroundClipper(),
                        child: Container(
                            width:
                                MediaQuery.of(context).size.width /* * 0.8 */,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .scaffoldBackgroundColor))))),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top +
                      defaultPadding * 1.5),
              child: Column(
                children: [
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
                          backgroundImage: const NetworkImage(
                              'https://www.google.com/maps/uv?pb=!1s0x3be0456a49d66ce5:0x1440baa58aadc609!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipMch9mtyD12KDnHPjIDIcs2O6E7FzsxdFHEOaIw%3Dw160-h160-k-no!5sharshil+thummar+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipMch9mtyD12KDnHPjIDIcs2O6E7FzsxdFHEOaIw&hl=en&sa=X&ved=2ahUKEwiR8uTN6bvvAhXoILcAHWvRBKUQoiowE3oECCEQAw')),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Text("Harshil Thummar",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 17)),
                  Text("Vancouver, BC, Canada",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 17)),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('7',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 17)),
                            Text('Posts',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 13)),
                          ],
                        ),
                        VerticalDivider(
                            indent: 20,
                            thickness: 1.4,
                            endIndent: 20,
                            color: Theme.of(context).dividerColor),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '5',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 17),
                            ),
                            Text(
                              'Orders',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                        VerticalDivider(
                            indent: 20,
                            thickness: 1.4,
                            endIndent: 20,
                            color: Theme.of(context).dividerColor),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '7',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 17),
                            ),
                            Text(
                              'Wish List',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                        VerticalDivider(
                            indent: 20,
                            thickness: 1.4,
                            endIndent: 20,
                            color: Theme.of(context).dividerColor),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '364',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 17),
                            ),
                            Text(
                              'Likes',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
