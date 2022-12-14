import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ewallet/pages/account_page.dart';
import 'package:ewallet/pages/history_page.dart';
import 'package:ewallet/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}
class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: getTabs(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectedTab(4);
          });
        },
        child: Icon(AntDesign.qrcode, size: 30,),
        backgroundColor: secondary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: getBody(),
    );
  }
  Widget getTabs(){
    List<IconData> iconsItems=[
      MaterialCommunityIcons.home,
      MaterialCommunityIcons.history,
      MaterialCommunityIcons.wallet,
      MaterialCommunityIcons.account,
    ];
    return AnimatedBottomNavigationBar(
      activeColor: secondary,
      splashColor: secondary,
      inactiveColor: grey,
      icons: iconsItems,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      activeIndex: pageIndex,
      onTap: (index ) {
        setState(() {
          selectedTab(index);
        });
      },
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: [
        Center(child: Text("Home")),
        Center(child: Text("History")),
        Center(child: Text("Wallet")),
        AccountPage(),
        Center(child: Text("QR")),
      ],
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}