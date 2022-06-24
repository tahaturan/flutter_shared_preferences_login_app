import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences_login_app/constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Kullanici Adi: ", style: Constants.anaSayfaTextStyle),
            Text("Sifre: ", style: Constants.anaSayfaTextStyle),
          ],
        ),
      ),
    );
  }
}
