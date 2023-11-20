import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'sign_in.dart';
import 'walkthrough.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();

  bool isLogin = sp.getBool('login') ?? false;
  // OneSignal.shared.setAppId('7880e9f7-4d17-4845-b4e2-32ef52d76305');
  // GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bool firstPage = sp.getBool('firstpage') ?? false;
  // OneSignal.shared.setNotificationOpenedHandler((value) {
  //   navigatorKey.currentState!.push(
  //     MaterialPageRoute(
  //       builder: (context) => Notifications(),
  //     ),
  //   );
  // });
  // bool isID = sp.getString('user_id') != null ? true : false;

  await Future.delayed(const Duration(seconds: 3));
  runApp(
    MaterialApp(
      builder: (context,child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!);
      },
      // navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // home: isLogin
      //     ? const Home()
      //     : isID
      //     ? const SelectCourse()
      //     : const Register(),
      home: firstPage ? isLogin ? Home() : SignIn() :FirstSlide(),
    ),
  );
}