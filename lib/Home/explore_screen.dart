// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../Constance/constance.dart';
import '../Widgets/shimmer.dart';
import '../Constance/theme.dart';
import '../Models/models.dart';
import '../Widgets/auto_size_text.dart';
import '../Widgets/common_button.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController controller = TextEditingController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    setState(() {
      shimmerEnable = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      shimmerEnable = false;
    });
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding).copyWith(
                top: MediaQuery.of(context).padding.top + defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SplashIcon(
                    onPressed: () {},
                    size: 30,
                    icon: Image.asset(ConstanceData.notificationIcon,
                        height: 24)),
                Text("DYNE",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                SplashIcon(
                    onPressed: () {
                      AppTheme.isLightTheme
                          ? changeColor(context, dark)
                          : changeColor(context, light);
                    },
                    size: 30,
                    icon: Image.asset(ConstanceData.messIcon, height: 24)),
              ],
            ),
          ),
          CustomField(
              controller: controller,
              textInputAction: TextInputAction.search,
              hintText: "Search Restaurants and Cuisines",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16, color: Theme.of(context).backgroundColor),
              fillColor: Theme.of(context).backgroundColor.withOpacity(0.6),
              hoverColor: Theme.of(context).backgroundColor.withOpacity(0.6),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16),
              margin:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 1.8)
                      .copyWith(bottom: defaultPadding),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius * 1.7),
                  borderSide: BorderSide(
                      color: Theme.of(context).backgroundColor, width: 1.5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius * 1.7),
                  borderSide: BorderSide(
                      color: Theme.of(context).backgroundColor, width: 0.0)),
              prefixChild:
                  Image.asset(ConstanceData.searchIcon, height: 20, width: 20),
              suffixChild: SplashIcon(
                  onPressed: () {
                    controller.clear();
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  icon: CircleAvatar(
                      radius: 11,
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: Icon(Icons.close,
                          size: 18, color: Theme.of(context).primaryColor)))),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(defaultRadius * 3.2))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(defaultRadius * 3.2)),
                child: SmartRefresher(
                  enablePullDown: true,
                  onLoading: onLoading,
                  onRefresh: onRefresh,
                  controller: refreshController,
                  header: WaterDropMaterialHeader(),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ShimmerCustom(
                        child: SizedBox(
                          height: 190,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                                left: defaultPadding / 2,
                                right: defaultPadding / 2),
                            itemCount: offerListData.isNotEmpty
                                ? offerListData.length
                                : 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.45,
                                  padding:
                                      const EdgeInsets.all(defaultPadding - 3),
                                  margin: const EdgeInsets.only(
                                      right: defaultPadding / 2,
                                      top: defaultPadding - 3,
                                      left: defaultPadding / 2,
                                      bottom: defaultPadding - 3),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Theme.of(context).shadowColor,
                                            blurRadius: 5,
                                            spreadRadius: 2),
                                      ],
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          defaultRadius * 2.8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              offerListData[index].image))),
                                  child: offerListData.isNotEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (offerListData[index].newPartner)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            defaultPadding /
                                                                1.6),
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .backgroundColor,
                                                        borderRadius: BorderRadius
                                                                .circular(
                                                                    defaultRadius *
                                                                        1.6)
                                                            .copyWith(
                                                                topLeft:
                                                                    const Radius
                                                                            .circular(
                                                                        0))),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Stack(
                                                          children: <Widget>[
                                                            Positioned(
                                                              top: 2.5,
                                                              child: Icon(
                                                                Icons.star,
                                                                size: 27,
                                                                color: Theme.of(
                                                                        context)
                                                                    .shadowColor
                                                                    .withOpacity(
                                                                        0.4),
                                                              ),
                                                            ),
                                                            Icon(Icons.star,
                                                                size: 27,
                                                                color: Colors
                                                                        .yellow[
                                                                    600]),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            width:
                                                                defaultPadding /
                                                                    2),
                                                        Text(
                                                          "NEW PARTNER",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline1,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            else
                                              const SizedBox(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                      defaultPadding / 2),
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .backgroundColor,
                                                      borderRadius: BorderRadius
                                                              .circular(
                                                                  defaultRadius *
                                                                      1.6)
                                                          .copyWith(
                                                              topLeft: const Radius
                                                                      .circular(
                                                                  0))),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        offerListData[index]
                                                            .logo,
                                                        height: 21,
                                                        color: AppTheme
                                                                .isLightTheme
                                                            ? null
                                                            : offerListData[
                                                                    index]
                                                                .color,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      listTitleRow(title: 'Friends', onPressed: () {}),
                      ShimmerCustom(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                              top: defaultPadding / 2,
                              bottom: defaultPadding / 2),
                          child: friendListData.isEmpty
                              ?
                              /* Friend list Is Empty */
                              CustomButton(
                                  horizontalMargin: defaultPadding,
                                  responsive: true,
                                  icon: Icons.person_add,
                                  text: "Add Friends",
                                  onPressed: () {},
                                )
                              : Wrap(
                                  alignment: WrapAlignment.spaceEvenly,
                                  children: List.generate(
                                    friendListData.length,
                                    (index) {
                                      return Container(
                                        padding: const EdgeInsets.all(4.5),
                                        decoration: BoxDecoration(
                                          color: friendListData[index].isOnline
                                              ? onlineStatusColor
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Theme.of(context)
                                                    .shadowColor,
                                                blurRadius: 10,
                                                spreadRadius: 2),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          radius: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              13.5,
                                          backgroundColor:
                                              Theme.of(context).backgroundColor,
                                          backgroundImage: AssetImage(
                                              friendListData[index].image),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ),
                      listTitleRow(
                          title: 'Trending Restaurants', moreButton: false),
                      ShimmerCustom(
                        child: SizedBox(
                          height: 190,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                                left: defaultPadding / 2,
                                right: defaultPadding / 2),
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              padding: const EdgeInsets.all(defaultPadding),
                              margin: const EdgeInsets.only(
                                  right: defaultPadding / 2,
                                  top: defaultPadding - 3,
                                  left: defaultPadding / 2,
                                  bottom: defaultPadding - 3),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).shadowColor,
                                        blurRadius: 5,
                                        spreadRadius: 2),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      defaultRadius * 2.8),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          trendingRestaurantsList[index]
                                              .image))),
                              child: trendingRestaurantsList.isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      padding: const EdgeInsets.symmetric(
                                                          horizontal: defaultPadding /
                                                              3),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  defaultRadius /
                                                                      2)),
                                                      child: Text(
                                                          trendingRestaurantsList[index]
                                                                  .openOrClose
                                                              ? "OPEN"
                                                              : "CLOSE",
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headline1!
                                                              .copyWith(
                                                                  fontSize: 14,
                                                                  color: trendingRestaurantsList[index].openOrClose
                                                                      ? Colors.green
                                                                      : Colors.red))),
                                                  const SizedBox(height: 3),
                                                  Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal:
                                                              defaultPadding /
                                                                  3),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  defaultRadius /
                                                                      2)),
                                                      child: Row(
                                                        children: [
                                                          const Icon(Icons.star,
                                                              size: 15,
                                                              color:
                                                                  Colors.black),
                                                          Text(
                                                            trendingRestaurantsList[
                                                                    index]
                                                                .rating
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline1!
                                                                .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                            SplashIcon(
                                                size: 27,
                                                icon: const CircleAvatar(
                                                  backgroundColor:
                                                      Colors.black54,
                                                  radius: 13,
                                                  child: RotatedBox(
                                                      quarterTurns: 2,
                                                      child: Icon(
                                                          Icons.more_horiz,
                                                          color: Colors.white)),
                                                ))
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: defaultPadding / 2,
                                              horizontal: defaultPadding / 1.6),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .backgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                          defaultRadius * 1.6)
                                                      .copyWith(
                                                          topLeft: const Radius
                                                              .circular(0))),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                trendingRestaurantsList[index]
                                                    .foodName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1!
                                                    .copyWith(
                                                        color: Colors.red,
                                                        fontSize: 13),
                                              ),
                                              const SizedBox(
                                                  width: defaultPadding / 2),
                                              Flexible(
                                                child: Text(
                                                  trendingRestaurantsList[index]
                                                      .foodDetails,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline1!
                                                      .copyWith(fontSize: 13),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      listTitleRow(title: 'Cuisines'),
                      ShimmerCustom(
                        child: SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: cuisinesDataList.length,
                            padding: const EdgeInsets.only(
                                top: defaultPadding / 2,
                                left: defaultPadding / 2,
                                right: defaultPadding / 2,
                                bottom: defaultPadding),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) =>
                                Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 108,
                                      margin: const EdgeInsets.all(
                                          defaultPadding / 2),
                                      width: 110,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius * 2.3),
                                        color:
                                            Theme.of(context).backgroundColor,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Theme.of(context).shadowColor,
                                              blurRadius: 10,
                                              spreadRadius: 2),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              cuisinesDataList[index].image,
                                              alignment: Alignment.bottomCenter,
                                              height: 35),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: defaultPadding / 2),
                                            child: AutoSizeText(
                                                cuisinesDataList[index].name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(fontSize: 18)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context).shadowColor,
                                          offset: Offset(0.0, 4.0),
                                          blurRadius: 6,
                                          spreadRadius: 2),
                                    ],
                                  ),
                                  child: SplashIcon(
                                      size: 26,
                                      onPressed: () {},
                                      icon: CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              Theme.of(context).iconTheme.color,
                                          child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 16,
                                              color: Theme.of(context)
                                                  .backgroundColor))),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      hint: 'Search...',

      backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.6),
      // scrollPadding: EdgeInsets.all(defaultPadding),
      margins: EdgeInsets.all(defaultPadding),
      transitionDuration: const Duration(milliseconds: 500),
      transitionCurve: Curves.easeInOut,
      // physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.

      transition: ExpandingFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget listTitleRow({
    VoidCallback? onPressed,
    required String title,
    bool moreButton = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
          right: defaultPadding,
          left: defaultPadding,
          top: defaultPadding / 1.5),
      child: Row(
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize: 22)),
          if (moreButton)
            Row(
              children: [
                const SizedBox(width: defaultPadding - 8),
                SplashIcon(
                    size: 26,
                    onPressed: onPressed,
                    icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: Theme.of(context).backgroundColor))),
              ],
            )
          else
            const SizedBox()
        ],
      ),
    );
  }
}
