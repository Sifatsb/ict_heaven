// import 'package:flutter/material.dart';
// import 'package:ict_heaven/dashboard/dashboard.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const DashBoard(),
//     );
//   }
// }
//



import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ict_heaven/starter/splash_screen.dart';
import 'package:ict_heaven/starter/update_splash_screen.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';
import 'configure/app_colors.dart';
import 'controller/image_controller/image_get.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ImageGet()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppUpdateInfo? _updateInfo;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  checkForUpdate() {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
    return _updateInfo;
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  @override
  void initState() {
    checkForUpdate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'On The Way Queen Connect',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
        ),
      ),
      home:
      _updateInfo?.updateAvailability == UpdateAvailability.updateAvailable
          ? const UpdateScreen()
          : const AnimatedSplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
