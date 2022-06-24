import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences_login_app/constants/app_constants.dart';
import 'package:flutter_shared_preferences_login_app/views/home_page.dart';

//? tf = textfield

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var tfKullaniciAdiKontol = TextEditingController();
  var tfSifreKontrol = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Giris Ekrani'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kullaniciAdiTextField(),
            sifreTextField(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text(
                "Giris Yap",
              ),
            ),
          ],
        ),
      ),
    );
  }

  kullaniciAdiTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: tfKullaniciAdiKontol,
        decoration: const InputDecoration(
          hintText: "Kullanici Adinizi Giriniz",
          border:
              OutlineInputBorder(borderRadius: Constants.defauldTfBorderRadius),
          labelText: "Kullanci Adi",
          prefixIcon: Icon(Icons.person),
          suffixIcon: Icon(Icons.edit),
        ),
      ),
    );
  }

  sifreTextField() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: tfSifreKontrol,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Sifrenizi Giriniz",
          border:
              OutlineInputBorder(borderRadius: Constants.defauldTfBorderRadius),
          labelText: "Sifre",
          prefixIcon: Icon(Icons.key),
          suffixIcon: Icon(Icons.password),
        ),
      ),
    );
  }
}
