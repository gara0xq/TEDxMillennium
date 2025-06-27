import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/home/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'core/theme/themes.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/home/presentation/screens/blogs_screen.dart';

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
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/auth', page: () => LoginScreen()),
        GetPage(name: '/blogs', page: () => BlogsScreen()),
      ],
    );
  }
}
