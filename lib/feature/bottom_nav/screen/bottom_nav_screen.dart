import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/Profile/screen/profile_screen.dart';
import 'package:litlab_learning/feature/download/downloading_screen.dart';
import 'package:litlab_learning/feature/materials/screen/material_Page.dart';

import 'package:litlab_learning/feature/save_notes/screen/save_note.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
   final PersistentTabController _controller=PersistentTabController(initialIndex: 0);

  int selectindex=0;
   List<Widget> Pages= [
     MaterialScreen(),
       const DownloadingScreen(),
       const SaveNote(),
       const ProfileScreen(),
     ];

   //
   // List<PersistentBottomNavBarItem> _navBarsItems() {
   //   return [
   //     PersistentBottomNavBarItem(
   //       iconSize: scrWidth*0.05,
   //       icon: SvgPicture.asset("assets/images/homeicon.svg"),
   //       activeColorPrimary: CupertinoColors.activeBlue,
   //       inactiveColorPrimary: CupertinoColors.systemGrey,
   //    //   scrollController: _scrollController1,
   //       routeAndNavigatorSettings: RouteAndNavigatorSettings(
   //         initialRoute: "/",
   //         routes: {
   //            "/first": (final context) => const HomePage(),
   //            "/second": (final context) => const ModuleSummery(),
   //         },
   //       ),
   //     ),
   //     PersistentBottomNavBarItem(
   //       icon: SvgPicture.asset("assets/images/downloading.svg",width: scrWidth*0.08,),
   //
   //       activeColorPrimary: CupertinoColors.activeBlue,
   //       inactiveColorPrimary: CupertinoColors.systemGrey,
   //      // scrollController: _scrollController2,
   //       routeAndNavigatorSettings: RouteAndNavigatorSettings(
   //         initialRoute: "/",
   //         routes: {
   //            "/first": (final context) => const HomePage(),
   //            "/second": (final context) => const ModuleSummery(),
   //         },
   //       ),
   //     ),
   //     PersistentBottomNavBarItem(
   //       icon: SvgPicture.asset("assets/images/search.svg",width: scrWidth*0.08,),
   //
   //       activeColorPrimary: CupertinoColors.activeBlue,
   //       inactiveColorPrimary: CupertinoColors.systemGrey,
   //      // scrollController: _scrollController2,
   //       routeAndNavigatorSettings: RouteAndNavigatorSettings(
   //         initialRoute: "/",
   //         routes: {
   //            "/first": (final context) => const HomePage(),
   //            "/second": (final context) => const ModuleSummery(),
   //         },
   //       ),
   //     ),
   //     PersistentBottomNavBarItem(
   //       icon: SvgPicture.asset("assets/images/profile_bottom.svg",width: scrWidth*0.08,),
   //
   //       activeColorPrimary: CupertinoColors.activeBlue,
   //       inactiveColorPrimary: CupertinoColors.systemGrey,
   //      // scrollController: _scrollController2,
   //       routeAndNavigatorSettings: RouteAndNavigatorSettings(
   //         initialRoute: "/",
   //         routes: {
   //            "/first": (final context) => const HomePage(),
   //            "/second": (final context) => const ModuleSummery(),
   //         },
   //       ),
   //     ),
   //   ];
   // }
   int _currentIndex=0;
   @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //    width: scrWidth*0.9,
    //   child: PersistentTabView(
    //     context,
    //     controller: _controller,
    //     screens: _buildScreens(),
    //     items: _navBarsItems(),
    //     handleAndroidBackButtonPress: true, // Default is true.
    //     resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
    //     stateManagement: true, // Default is true.
    //     hideNavigationBarWhenKeyboardAppears: true,
    //     //popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
    //     padding: const EdgeInsets.only(top: 8),
    //     backgroundColor: Colors.white,
    //     isVisible: true,
    //     animationSettings: const NavBarAnimationSettings(
    //       navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
    //         duration: Duration(milliseconds: 400),
    //         curve: Curves.easeOutQuint,
    //       ),
    //       screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
    //         animateTabTransition: true,
    //         duration: Duration(milliseconds: 200),
    //         screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
    //       ),
    //     ),
    //     // confineToSafeArea: true,
    //     navBarHeight: kBottomNavigationBarHeight,
    //     navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property
    //   ),
    // );
     return Scaffold(

       bottomNavigationBar: SalomonBottomBar(

           currentIndex: _currentIndex,
           onTap:(i) => setState(() => _currentIndex = i),
           items: [
             SalomonBottomBarItem(
               selectedColor: ColorPalette.bottomButtonColor,
                 icon: SvgPicture.asset("assets/images/homeicon.svg",width: 30,), title:const Text("")),
             SalomonBottomBarItem(
                 selectedColor: ColorPalette.bottomButtonColor,
                 icon: SvgPicture.asset("assets/images/downloading.svg",width: 30,), title:const Text("")),
             SalomonBottomBarItem(
                 selectedColor: ColorPalette.bottomButtonColor,
                 icon: SvgPicture.asset("assets/images/fovorite_bottom.svg",width: 20,), title:const Text("")),
             SalomonBottomBarItem(
                 selectedColor: ColorPalette.bottomButtonColor,
                 icon: SvgPicture.asset("assets/images/profile_bottom.svg",width: 30,), title:const Text(""))
           ]),
       body:Pages[_currentIndex] ,
     );
  }
}


