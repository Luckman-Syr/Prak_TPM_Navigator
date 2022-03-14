import 'package:flutter/material.dart';
import 'package:coba/loginPage.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 44, 44),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
                size: 30.0,
              )),
          const Padding(padding: EdgeInsets.only(right: 50.0))
        ],
        title: Text("Halo, " + username),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.network(
                'https://asset.kompas.com/crops/SV5q4gPkeD8YJTuzO31BqTr9DEI=/192x128:1728x1152/750x500/data/photo/2021/03/06/60436a28b258b.jpg',
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Text(
              "Halo " + username + " Apakah hari anda menyenangkan?",
              style: GoogleFonts.bebasNeue(fontSize: 20.0),
            ),
            ElevatedButton(
              onPressed: () {
                SnackBar snackBar = SnackBar(
                    content: Text("Jangan sedih sedih ya semangat terus okey"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              style: TextButton.styleFrom(),
              child: Text("Tekan Disini ya :)"),
            )
          ],
        ),
      ),
    ));
  }
}
