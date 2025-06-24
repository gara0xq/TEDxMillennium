import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Binding;

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
  await Supabase.initialize(
    url: 'https://tcymuqwvcmbhmvmzlvko.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjeW11cXd2Y21iaG12bXpsdmtvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA3MzU2NDUsImV4cCI6MjA2NjMxMTY0NX0.ISOYYQcX2r839I0J4FYfyUPNZodmkN--BMDsLvAaPn4',
  );
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
      initialBinding: Binding(),
      initialRoute: "/dashboard",
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/auth', page: () => LoginScreen()),
        GetPage(name: '/dashboard', page: () => BaseScreen()),
        GetPage(name: '/blogs', page: () => BlogsScreen()),
      ],
    );
  }
}
