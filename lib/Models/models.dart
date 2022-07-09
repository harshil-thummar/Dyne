import 'package:dyne/Constance/constance.dart';
import 'package:flutter/material.dart';

class AccountSpending {
  final String? name, initials;
  bool isSelected;

  AccountSpending({this.name, this.initials, this.isSelected = true});
}

List<AccountSpending> interestsList = <AccountSpending>[
  AccountSpending(name: 'Driving', initials: 'DR'),
  AccountSpending(name: 'Skiing', initials: 'SK'),
  AccountSpending(name: 'Food', initials: 'FD', isSelected: false),
  AccountSpending(name: 'Science', initials: 'SCI'),
  AccountSpending(name: 'Yoga', initials: 'YG'),
  AccountSpending(name: 'Music', initials: 'MS', isSelected: false),
  AccountSpending(name: 'Drinks', initials: 'DK'),
  AccountSpending(name: 'Lebanese', initials: 'LB'),
  AccountSpending(name: 'Mexican', initials: 'MX'),
];

class BottomBarData {
  final String name, image;
  final int index;

  BottomBarData({this.name = "none", required this.image, this.index = 0});
}

List<BottomBarData> bottomBarData = <BottomBarData>[
  BottomBarData(name: "Explore", image: ConstanceData.exploreIcon, index: 0),
  BottomBarData(name: "Radar", image: ConstanceData.radarIcon, index: 1),
  BottomBarData(name: "Coupons", image: ConstanceData.couponsIcon, index: 2),
  BottomBarData(name: "Profile", image: ConstanceData.profileIcon, index: 3),
];

class OfferListData {
  final String image;
  final String logo;
  Color? color;
  bool newPartner;
  OfferListData(
      {required this.logo,
      required this.image,
      this.newPartner = false,
      this.color});
}

List<OfferListData> offerListData = <OfferListData>[
  OfferListData(
      image: ConstanceData.offer_0,
      logo: ConstanceData.fioreTextLogo,
      color: Colors.white,
      newPartner: true),
  OfferListData(
    image: ConstanceData.offer_1,
    logo: ConstanceData.theRiseLogo,
  ),
  OfferListData(
    image: ConstanceData.offer_0,
    logo: ConstanceData.fioreTextLogo,
    color: Colors.white,
  ),
  OfferListData(
      image: ConstanceData.offer_1,
      logo: ConstanceData.theRiseLogo,
      newPartner: true),
];

class FriendListData {
  final String image;
  final String name;
  bool isOnline;
  FriendListData({required this.image, this.isOnline = false, this.name = ""});
}

List<FriendListData> friendListData = <FriendListData>[
  FriendListData(image: ConstanceData.friend_0, name: "Payal"),
  FriendListData(image: ConstanceData.friend_1, name: "Priya"),
  FriendListData(image: ConstanceData.friend_2, name: "Sonam"),
  FriendListData(image: ConstanceData.friend_3, isOnline: true, name: "Ankit"),
  FriendListData(image: ConstanceData.friend_4, name: "Digant"),
];

class TrendingRestaurantsData {
  final String image;
  bool openOrClose;
  double rating;
  String foodName, foodDetails;
  TrendingRestaurantsData({
    required this.image,
    this.openOrClose = false,
    this.rating = 4.8,
    this.foodName = "",
    this.foodDetails = "(_)",
  });
}

List<TrendingRestaurantsData> trendingRestaurantsList =
    <TrendingRestaurantsData>[
  TrendingRestaurantsData(
      image: ConstanceData.restaurant_0,
      openOrClose: true,
      foodName: "33 Acres",
      foodDetails: "(15 W 8th Ave, Vancouver)"),
  TrendingRestaurantsData(
      image: ConstanceData.restaurant_1,
      rating: 4.5,
      foodName: "Steakhouse",
      foodDetails: "v(1109 Hamilton St, Vancouver )"),
  TrendingRestaurantsData(
      image: ConstanceData.restaurant_0,
      rating: 4.5,
      foodName: "33 Acres",
      foodDetails: "(15 W 8th Ave, Vancouver)"),
  TrendingRestaurantsData(
      image: ConstanceData.restaurant_1,
      openOrClose: true,
      foodName: "Steakhouse",
      foodDetails: "v(1109 Hamilton St, Vancouver )"),
];

class CuisinesData {
  final String image, name;
  CuisinesData({this.image = "", this.name = "none"});
}

List<CuisinesData> cuisinesDataList = <CuisinesData>[
  CuisinesData(name: "American", image: ConstanceData.cuisines_0),
  CuisinesData(name: "Beer", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Bakery", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Cafe", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Dessert", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Drink", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Greek", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Italian", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Indian", image: ConstanceData.cuisines_1),
  CuisinesData(name: "Japanese", image: ConstanceData.cuisines_0),
  CuisinesData(name: "Mexican", image: ConstanceData.cuisines_2),
  CuisinesData(name: "Pizza", image: ConstanceData.cuisines_1),
  CuisinesData(name: "Vegan", image: ConstanceData.cuisines_2),
];
