import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coba/loginPage.dart';

class SiginPage extends StatefulWidget {
  const SiginPage({Key? key}) : super(key: key);

  @override
  _SiginPageState createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  String username = "", password = "", alamat = "";
  bool isRegisterSuccess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 50.0)),
                  _iconLogin(),
                  _title(),
                ],
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    _content(),
                    _buttonRegis(context),
                    _buttonLogin(context),
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
      width: 50.0,
      height: 50.0,
    );
  }

  Widget _title() {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 50.0),
        ),
        Text(
          "SIGN",
          style: GoogleFonts.anton(fontStyle: FontStyle.normal, fontSize: 20.0),
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
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                    color: (isRegisterSuccess)
                        ? Color.fromARGB(255, 75, 196, 226)
                        : Color.fromARGB(255, 214, 32, 32),
                    width: 2.0,
                  )),
              hintText: "Username",
              hintStyle: const TextStyle(color: Colors.black)),
          textAlign: TextAlign.center,
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
                  color: (isRegisterSuccess)
                      ? Color.fromARGB(255, 75, 196, 226)
                      : Color.fromARGB(255, 214, 32, 32),
                  width: 2.0,
                ),
              ),
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.black)),
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.only(top: 20.0)),
        TextField(
          onChanged: (value) {
            alamat = value;
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                borderSide: BorderSide(
                  color: (isRegisterSuccess)
                      ? Color.fromARGB(255, 75, 196, 226)
                      : Color.fromARGB(255, 214, 32, 32),
                  width: 2.0,
                ),
              ),
              hintText: "Alamat",
              hintStyle: const TextStyle(color: Colors.black)),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buttonRegis(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 214, 32, 32),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0))),
        onPressed: () {
          String text = "";
          if (username != "" && password != "" && alamat != "") {
            setState(() {
              text = "Registrasi Success";
              isRegisterSuccess = true;
            });
          } else {
            setState(() {
              text = "Registrasi Failed";
              isRegisterSuccess = false;
            });
          }
          print("isRegisterSuccess: $isRegisterSuccess");
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text(
          "Registrasi",
        ),
      ),
    );
  }

  Widget _buttonLogin(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(top: 20.0)),
        const Text(
          "Sudah Punya akun?",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Color.fromARGB(255, 214, 32, 32)),
          ),
        ),
      ],
    );
  }

  // void _loginProcess(BuildContext context){
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  //     return HomePage();
  //   }));
  // }

}
