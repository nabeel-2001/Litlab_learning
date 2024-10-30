import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hive/hive.dart';
import 'package:litlab_learning/core/contants/provider/const_provider.dart';
import 'package:litlab_learning/core/local/local_variables.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery_web.dart';
import 'package:litlab_learning/feature/Profile/screen/profile_setting_web.dart';
import 'package:litlab_learning/feature/auth/controller/auth_controller.dart';
import 'package:litlab_learning/feature/home/screen/home_screen_web.dart';
import 'package:litlab_learning/feature/materials/screen/material_page_web.dart';


import 'package:litlab_learning/feature/save_notes/screen/save_note_web.dart';
import 'package:litlab_learning/feature/save_notes/screen/save_note_web_main.dart';
import 'package:litlab_learning/model/users_model.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBarPage extends ConsumerStatefulWidget {
  const SideBarPage({super.key});

  @override
  ConsumerState<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends ConsumerState<SideBarPage> {
  getUserFromHive() async {
    var box = await Hive.openBox('userBox');
    UserModel? userModel=await  box.get('currentUser') as UserModel?;
    ref.read(userProvider.notifier).update((state) => userModel,);
    print(userModel!.id);
  }
  @override
  void didChangeDependencies() {
    getUserFromHive();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final selectedPageIndex = ref.watch(selectedPageIndexProvider); // Watch the selected page index

    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      appBar: isSmallScreen
          ? AppBar(
        backgroundColor: Colors.white,
        title: Text(_getTitleByIndex(selectedPageIndex)),
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
      )
          : null,
      drawer: ExampleSidebarX(),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(),
          Expanded(
            child: Center(
              child: _getPageByIndex(selectedPageIndex),  // Dynamically get the page
            ),
          ),
        ],
      ),
    );
  }
}




  Widget _getPageByIndex(int index) {
    switch (index) {
      case 0:
        return const HomeScreenWeb();
      case 1:
        return const FavouritePageWebMainScreen();
      case 2:
        return const ProfileSettingsWeb();
      case 3:
        return const MaterialPageWeb();
      case 4:
        return  const ModuleSummaryWeb();
      default:
        return const Center(child: Text("Page not found"));
    }
  }

  String _getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Favourites';
      case 2:
        return 'Profile';

      default:
        return 'Not found page';
    }
  }



class ExampleSidebarX extends ConsumerWidget {
  const ExampleSidebarX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = SidebarXController(selectedIndex: 0, extended: true);

    return SidebarX(
      controller: controller,
      theme: SidebarXTheme(
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 20),
        hoverColor: Colors.blue[100],
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
            child: Image.asset('assets/images/Logo P 1.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          iconBuilder: (selected, hovered) {
            return SvgPicture.asset("assets/images/homeicon.svg", width: 24);
          },
          label: 'Home',
          onTap: () {
            ref.read(selectedPageIndexProvider.notifier).state = 0;  // Update the selected page index
          },
        ),
        SidebarXItem(
          iconBuilder: (selected, hovered) {
            return SvgPicture.asset("assets/images/favorite.svg", width: 24);
          },
          label: 'Favourites',
          onTap: () {
            ref.read(selectedPageIndexProvider.notifier).state = 1;  // Update the selected page index
          },
        ),
        SidebarXItem(
          iconBuilder: (selected, hovered) {
            return SvgPicture.asset("assets/images/profile_bottom.svg", width: 24);
          },
          label: 'Profile',
          onTap: () {
            ref.read(selectedPageIndexProvider.notifier).state = 2;  // Update the selected page index
          },
        ),

      ],
    );
  }
}

