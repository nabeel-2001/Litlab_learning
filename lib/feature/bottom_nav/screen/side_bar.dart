import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery_web.dart';
import 'package:litlab_learning/feature/Profile/screen/profile_setting_web.dart';
import 'package:litlab_learning/feature/home/screen/home_screen_web.dart';


import 'package:litlab_learning/feature/save_notes/screen/save_note_web.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarPage extends StatefulWidget {
  const SideBarPage({super.key});

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
        backgroundColor: Colors.white,
        title: Text(_getTitleByIndex(_controller.selectedIndex)),
        leading: IconButton(
          onPressed: () {
            _key.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      )
          : null,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(controller: _controller,),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        width: 200, // Adjusting width to make it more compact.
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
            // margin: const EdgeInsets.only( left: 10, bottom: 10), // Similar padding as per the image.
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 20),
        hoverColor: Colors.blue[100], // Slight hover effect.
        textStyle: const TextStyle(color: Colors.black87),
        selectedTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black54,
          size: 24,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.blue,
          size: 24,
        ),
      ),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/Logo P 1.png'), // Adjust the logo path.
          ),
        );
      },
      items: [
        SidebarXItem(
          iconBuilder: (selected, hovered) {
            return SvgPicture.asset("assets/images/homeicon.svg",
              width: scrWidth*0.015,);
          },
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
         SidebarXItem(
           iconBuilder: (selected, hovered) {
             return SvgPicture.asset("assets/images/favorite.svg",
               width: scrWidth*0.015,);
           },

          label: 'Favourites',
        ),
         SidebarXItem(
          iconBuilder: (selected, hovered) {
            return SvgPicture.asset("assets/images/profile_bottom.svg",
            width: scrWidth*0.02,);
          },
          label: 'Profile',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {

  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return  const HomeScreenWeb();
          case 1:
            return FavoritesPage();
          case 2:
            return ProfileSettingsWeb();
          default:
            return Center(
              child: Text(
                pageTitle,
                style: theme.textTheme.headlineSmall,
              ),
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Downloads';
    case 2:
      return 'Saved';
    default:
      return 'Not found page';
  }
}
