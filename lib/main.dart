import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nawel/config/routes/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/config/theme/app_theme.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setup(); // await for the logic in the service locator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        375,
        812,
      ), // Base design size for responsive layout
      minTextAdapt: true, // Ensures text scales to fit smaller devices
      splitScreenMode:
          true, // Enables better layout support in split-screen mode
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: appTheme,
        );
      },
    );
  }
}
