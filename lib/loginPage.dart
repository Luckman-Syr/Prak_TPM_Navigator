import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coba/siginPage.dart';
import 'package:coba/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "", password = "";
  bool isLoginSuccess = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromRGBO(255, 255, 255, 1),
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 50.0)),
                    _iconLogin(),
                    _title(),
                    _content(),
                    _buttonLogin(context),
                    _buttonSigin(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "assets/images/logo.png",
      width: 200.0,
      height: 200.0,
    );
  }

  Widget _title() {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 30.0),
        ),
        Text(
          "LOGIN",
          style: GoogleFonts.anton(fontStyle: FontStyle.normal, fontSize: 30.0),
        ),
      ],
    );
  }

  Widget _content() {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(top: 30.0)),
        TextField(
          onChanged: (value) {
            username = value;
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                    color: (isLoginSuccess)
                        ? Color.fromARGB(255, 75, 196, 226)
                        : Color.fromARGB(255, 214, 32, 32),
                    width: 2.0,
                  )),
              hintText: "Username",
              hintStyle: const TextStyle(color: Colors.black)),
        ),
        const Padding(padding: EdgeInsets.only(top: 20.0)),
        TextField(
          onChanged: (value) {
            password = value;
          },
          obscureText: true,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(
                  color: (isLoginSuccess)
                      ? Color.fromARGB(255, 75, 196, 226)
                      : Color.fromARGB(255, 214, 32, 32),
                  width: 2.0,
                ),
              ),
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.black)),
        )
      ],
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: (isLoginSuccess)
                ? Color.fromARGB(255, 75, 196, 226)
                : Color.fromARGB(255, 214, 32, 32),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0))),
        onPressed: () {
          String text = "";
          if (username == "123190151" && password == "alvaro123") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
              // _loginProcess(context, username);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage(
                  username: username,
                );
              }));
            });
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          print("isLoginSuccess: $isLoginSuccess");
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          "Login",
        ),
      ),
    );
  }

  Widget _buttonSigin(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(top: 20.0)),
        const Text(
          "Belum punya akun?",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            _registerProcess(context);
          },
          child: const Text(
            "Registrasi",
            style: TextStyle(color: Color.fromARGB(255, 214, 32, 32)),
          ),
        ),
      ],
    );
  }

  // void _loginProcess(BuildContext context, String username) {
  //   Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (context) => HomePage(title: username)));
  // }

  void _registerProcess(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SiginPage();
    }));
  }
}
