import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/theme/themes.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'firebase_options.dart';
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
    return GetMaterialApp.router(
      title: "TEDxMillennium",
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.dark,
      routerDelegate: AppRouterDelegate(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/auth', page: () => LoginScreen()),
        GetPage(name: '/admin', page: () => HomeScreen(isAdmin: true)),
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
