// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ronda/app/configs/palette.config..dart';

import '../controllers/app_controller.dart';


class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    //final AppController appController = Provider.of(context, listen: true);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset("assets/user_pic.png"),
            ),
            accountName: Text(AppController.instance.auth.user.userName),
            accountEmail: Text(""),
            decoration: BoxDecoration(
              color: Palette.customBlue.shade300,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Início"),
            subtitle: Text("tela de inicio"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            subtitle: Text("Finalizar sessao"),
            onTap: () {
              AppController.instance.logout(context);
            },
          ),
        ],
      ),
    );
  }
}
