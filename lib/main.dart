import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:litlab_learning/core/common/responsive_screens/common_paper_responsive.dart';
import 'package:litlab_learning/core/common/responsive_screens/course_responsive_screen.dart';
import 'package:litlab_learning/core/common/responsive_screens/login_response_screen.dart';
import 'package:litlab_learning/core/common/responsive_screens/registration_response_screen.dart';
import 'package:litlab_learning/core/common/responsive_screens/reponsive_material_screen.dart';
import 'package:litlab_learning/core/common/responsive_screens/responsive_department_screen.dart';
import 'package:litlab_learning/core/common/responsive_screens/responsive_home.dart';
import 'package:litlab_learning/core/common/responsive_screens/responsive_onbody_screen.dart';
import 'package:litlab_learning/core/common/responsive_screens/responsive_semester_screen.dart';
import 'package:litlab_learning/core/common/responsive_screens/resposive_module_summery.dart';
import 'package:litlab_learning/core/common/responsive_screens/sidebar_responsive.dart';
import 'package:litlab_learning/core/common/responsive_screens/splash_response_screen.dart';
import 'package:litlab_learning/feature/auth/screens/OtpScreen.dart';
import 'package:litlab_learning/feature/auth/screens/login_page_web.dart';
import 'package:litlab_learning/feature/auth/screens/register_page_web.dart';
import 'package:litlab_learning/feature/auth/screens/registeration_page.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/side_bar.dart';
import 'package:litlab_learning/feature/courses/screen/course_screen_web.dart';
import 'package:litlab_learning/feature/department/screen/department_screen_web.dart';
import 'package:litlab_learning/feature/download/downloading_screen.dart';
import 'package:litlab_learning/feature/Modules/screen/module_summery.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/bottom_nav_screen.dart';
import 'package:litlab_learning/feature/home/screen/home_screen_web.dart';
import 'package:litlab_learning/feature/materials/screen/material_page_web.dart';
import 'package:litlab_learning/feature/materials/screen/material_view_pdf.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/OnBody_Screen.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/loading_screen.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/loading_screen_web.dart';
import 'package:litlab_learning/feature/onboarding_screen/screen/onbody_screen_web.dart';
import 'package:litlab_learning/feature/semester/screen/semester_web_screen.dart';
import 'package:litlab_learning/feature/splash_screen/screen/splash_screen.dart';
import 'package:litlab_learning/feature/bottom_nav/screen/side_bar.dart';
import 'package:litlab_learning/feature/splash_screen/screen/splash_screen_web.dart';
import 'package:litlab_learning/firebase_options.dart';
import 'package:litlab_learning/model/common_paper.dart';
import 'package:litlab_learning/model/material_model.dart';
import 'package:litlab_learning/model/users_model.dart';
import 'package:sidebarx/sidebarx.dart';
import 'core/local/local_variables.dart';
String? currentUserId;


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(UserModelAdapter().typeId)){
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MaterialModelAdapter());
  }
  runApp(
    //
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp()),
       ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: () {

        FocusManager.instance.primaryFocus!.unfocus();
      },

      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        // routerConfig: _router,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        initialRoute: '/',
        routes: {
         '/': (context) =>  const SplashResponsiveLayout(),
          'onBody_screen/department_screen/course_screen_web': (context) => const CourseScreenWeb(),
          'onBody_screen': (context) => const OnBodyResponsive(),
          'department_screen':(context)=>const DepartmentResponsiveLayout(),
          'sideBar_Page/home_screen':(context)=>const HomeResponsiveLayout(),
          'course_screen':(context)=>const CourseResponsiveLayout(),
          'common_screen':(context)=> const CommonPaperResponsiveLayout(),
          'semester_screen':(context)=>const SemesterResponsiveLayout(),
          'loading_screenWeb':(context)=>const LoadingScreenWeb(),
            'sideBar_Page':(context)=>const SideBarResponsiveLayout(),
          'login_page':(context)=>const LoginResponsiveLayout(),
          'registration':(context)=>const RegistrationResponsiveLayout(),
          'sideBar_Page/material_pageWeb':(context)=>const MaterialPageResponsive(),
          'sideBar_Page/material_pageWeb/module_summery':(context)=>const ModuleSummeryResponsiveLayout(),
        },

      ),
    );
  }
}



// final GoRouter _router = GoRouter(
//   routes: [
//
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const SplashScreenWeb(),
//     ),
//     GoRoute(
//       path: '/on_body',
//       builder: (context, state) => const OnBodyScreenWeb(),
//     ),
//     GoRoute(
//       path: '/department',
//       builder: (context, state) => const DepartmentScreen(),
//     ),
//     GoRoute(
//       path: '/course_screen_web',
//       builder: (context, state) => const CourseScreenWeb(),
//     ),
//     GoRoute(
//       path: '/home_screen',
//       builder: (context, state) => const HomeScreenWeb(),
//     ),
//     GoRoute(
//       path: '/common_screen',
//       builder: (context, state) => const CommonPaperScreen(),
//     ),
//     GoRoute(
//       path: '/semester_screenWeb',
//       builder: (context, state) => const SemesterWebScreen(),
//     ),
//     GoRoute(
//       path: '/loading_screenWeb',
//       builder: (context, state) => const LoadingScreenWeb(),
//     ),
//     GoRoute(
//       path: '/sideBar_Page',
//       builder: (context, state) => const SideBarPage(),
//     ),
//     GoRoute(
//       path: '/register_page',
//       builder: (context, state) => const RegistrationWeb(),
//     ),
//     GoRoute(
//       path: '/login_page',
//       builder: (context, state) => const LoginPageWeb(),
//     ),
//
//   ],
// );