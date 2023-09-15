import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/routes/route_app.dart';
import 'helper/dependencies.dart' as dep;
import './view/Splash/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding
      .ensureInitialized(); //to be sure the lib is binding corectly
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
            debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
     fontFamily: 'BalooBhaijaan2',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      getPages: RouteApp.routes,
    );
  }
}
