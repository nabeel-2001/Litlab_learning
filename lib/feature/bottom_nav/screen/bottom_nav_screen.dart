import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:litlab_learning/core/contants/color_constants.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/home/screen/home.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
   final PersistentTabController _controller=PersistentTabController(initialIndex: 0);

  int selectindex=0;
   List<Widget> _buildScreens() {
     return [
HomePage(),
       const ModuleSummery(),
       const HomePage(),
       const ModuleSummery(),
     ];

   }
   List<PersistentBottomNavBarItem> _navBarsItems() {
     return [
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.home),
         activeColorPrimary: CupertinoColors.activeBlue,
         inactiveColorPrimary: CupertinoColors.systemGrey,
      //   scrollController: _scrollController1,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
           routes: {
              "/first": (final context) => const HomePage(),
              "/second": (final context) => const ModuleSummery(),
           },
         ),
       ),
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.settings),

         activeColorPrimary: CupertinoColors.activeBlue,
         inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController2,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
           routes: {
              "/first": (final context) => const HomePage(),
              "/second": (final context) => const ModuleSummery(),
           },
         ),
       ),
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.settings),

         activeColorPrimary: CupertinoColors.activeBlue,
         inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController2,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
           routes: {
              "/first": (final context) => const HomePage(),
              "/second": (final context) => const ModuleSummery(),
           },
         ),
       ),
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.settings),

         activeColorPrimary: CupertinoColors.activeBlue,
         inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController2,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
           routes: {
              "/first": (final context) => const HomePage(),
              "/second": (final context) => const ModuleSummery(),
           },
         ),
       ),
     ];
   }

   @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      //popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property
    );
  }
}

