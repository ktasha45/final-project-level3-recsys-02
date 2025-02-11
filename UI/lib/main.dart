import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/pages/main_page.dart';
import 'package:ui/pages/login_page.dart';
import 'package:ui/pages/signin_page.dart';
import 'package:ui/pages/start_page.dart';
import 'package:ui/pages/user_page.dart';

int userid = 1;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kLightGrey, // 강조색
        scaffoldBackgroundColor: kBlack, // 앱 배경색
      ),
      title: 'Final Project',
      home: TestPage(),
      initialRoute: '/home',
      routes: {
        "/home": (context) => const StartPage(),
        "/signin": (context) => const SigninPage(),
        "/main": (context) => MainPage(),
        "/mypage": (context) => const UserPage(),
        "/mypage/$userid": (context) => const UserPage(
              isMyPage: false,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text('--- 페이지 목록 ---', style: titleTextStyle))),
                defaultSpacer,
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: kWhite,
                      side: whiteBorder,
                      padding: const EdgeInsets.all(16)),
                  child: Text('메인페이지',
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                ),
                defaultSpacer,
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: kWhite,
                      side: whiteBorder,
                      padding: const EdgeInsets.all(16)),
                  child: Text('회원가입페이지',
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                ),
                defaultSpacer,
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: kWhite,
                      side: whiteBorder,
                      padding: const EdgeInsets.all(16)),
                  child: Text('시작페이지',
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                defaultSpacer,
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: kWhite,
                      side: whiteBorder,
                      padding: const EdgeInsets.all(16)),
                  child: Text('마이페이지',
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/mypage?id=$userid');
                  },
                ),
              ],
            )));
  }
}
