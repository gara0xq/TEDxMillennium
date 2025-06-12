import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'binding.dart';
import 'firebase_options.dart';
import 'core/theme/themes.dart';
import 'features/dashboard/presentation/screens/base_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/home/presentation/screens/blogs_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TEDxMillennium",
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.dark,
      // routerDelegate: AppRouterDelegate(),
      initialBinding: Binding(),
      initialRoute: "dashboard",
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/auth', page: () => LoginScreen()),
        GetPage(name: '/dashboard', page: () => BaseScreen()),
        GetPage(name: '/blogs', page: () => BlogsScreen()),
      ],
    );
  }
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, current) {
        return Theme(
          data: Themes.darkTheme,
          child: Navigator(
            key: Get.key,
            onPopPage: (route, result) => route.didPop(result),
            pages:
                currentConfiguration != null
                    ? [currentConfiguration!.currentPage!]
                    : [GetNavConfig.fromRoute("/")!.currentPage!],
          ),
        );
      },
    );
  }
}
