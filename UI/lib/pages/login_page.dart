import 'package:flutter/material.dart';
import 'package:ui/constants.dart';
import 'package:ui/utils/dio_client.dart';
import 'package:ui/widgets/footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMsg = '';
  var idTextController = TextEditingController();
  var pwdTextController = TextEditingController();
  final DioClient dioClient = DioClient();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(200, 0, 0, 0),
        body: Center(
            child: Stack(alignment: Alignment.topRight, children: [
          Container(
              height: 500,
              width: 500,
              padding: const EdgeInsets.symmetric(horizontal: 45),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: kWhite),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png'),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: idTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: '아이디',
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            borderSide: whiteBorder),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.person)),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    controller: pwdTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: '비밀번호',
                        border: OutlineInputBorder(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            borderSide: whiteBorder),
                        filled: true,
                        contentPadding: const EdgeInsets.all(16),
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.password)),
                  ),
                  Container(
                      child: Text(
                    errorMsg,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
                  defaultSpacer,
                  Container(
                      width: buttonWidth * 4.5,
                      height: titleHeight,
                      child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: kWhite,
                            side: whiteBorder,
                            padding: const EdgeInsets.all(16)),
                        child: Text('로그인하기',
                            style: TextStyle(
                              color: kBlack,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            )),
                        onPressed: () async {
                          var code = await dioClient.loginUser(
                              email: idTextController.text,
                              pwd: pwdTextController.text);
                          if (code == 200) {
                            isLogin = true;
                            Navigator.pushReplacementNamed(context, '/main');
                          } else {
                            errorMsg = '아이디 혹은 비밀번호가 존재하지 않습니다';
                          }
                          setState(() {});
                        },
                      )),
                  defaultSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defaultSpacer,
                      TextButton(
                        child: Text('아이디찾기',
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 14.0,
                            )),
                        onPressed: () {},
                      ),
                      Text(
                        '|',
                        style: TextStyle(color: kWhite),
                      ),
                      TextButton(
                        child: Text('비밀번호찾기',
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 14.0,
                            )),
                        onPressed: () {},
                      ),
                      Text(
                        '|',
                        style: TextStyle(color: kWhite),
                      ),
                      TextButton(
                        child: Text('회원가입',
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 14.0,
                            )),
                        onPressed: () {},
                      ),
                      defaultSpacer,
                    ],
                  ),
                ],
              )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close, color: kWhite)),
        ])));
  }
}
