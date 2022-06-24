import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences_login_app/constants/app_constants.dart';
import 'package:flutter_shared_preferences_login_app/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String spKullaniciAdi = "";
  String spSifre = "";

  Future<void> oturumBilgisiOku() async {
    var sp = await SharedPreferences.getInstance();

    setState(() {
      spKullaniciAdi = sp.getString("kullaniciAdi") ?? "Kullanici Adi Yok";
      spSifre = sp.getString("Sifre") ?? "Sifre Yok";
    });
  }

  @override
  void initState() {
    super.initState();
    oturumBilgisiOku();
  }

  Future<void> cikisYap() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("kullaniciAdi");
    sp.remove("Sifre");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
        actions: [
          IconButton(
            onPressed: () {
              cikisYap();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kullanici Adi: $spKullaniciAdi",
                style: Constants.anaSayfaTextStyle),
            Text("Sifre: $spSifre", style: Constants.anaSayfaTextStyle),
          ],
        ),
      ),
    );
  }
}
