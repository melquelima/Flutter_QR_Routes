import 'package:ronda/app/configs/palette.config..dart';
import 'package:ronda/app/pages/predios/predios.dart';
import 'package:flutter/material.dart';

import '../../modules/drawer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _current_Index = 1;

  List<List<Widget>> body = const [
    [Text("Home"), Icon(Icons.home)],
    [Text("Predios"), Predios()],
    [Text("Configurações"), Icon(Icons.menu)],
    [Text("QRCode"), Icon(Icons.qr_code)],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(
          title: body[_current_Index][0],
          backgroundColor: Palette.customBlue.shade300,
        ),
        body: Center(child: body[_current_Index][1]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _current_Index,
          onTap: (int newIndex) {
            setState(() {
              _current_Index = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Prédios",
              icon: Icon(Icons.location_city),
            ),
            BottomNavigationBarItem(
              label: "Configurações",
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              label: "QrCode",
              icon: Icon(Icons.qr_code),
            ),
          ],
        ));
  }
}
