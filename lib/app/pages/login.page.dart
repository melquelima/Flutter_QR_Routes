// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:go_router/go_router.dart';
import 'package:ronda/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:ronda/app/pages/home/bottom_menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formkey,
            child: Stack(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/login/fundo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                //width: double.infinity,
                //height: double.infinity,
                //color: Colors.amber,
                alignment: Alignment.center,
                child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 100,
                      maxWidth: 300,
                      //minHeight: 200,
                      maxHeight: 250,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Image.asset(
                          //   "assets/logo.png",
                          //   width: 150,
                          //   height: 150,
                          // ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'User',
                            ),
                            controller: _usuarioController,
                            keyboardType: TextInputType.text,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            controller: _senhaController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(40),
                                backgroundColor: Color.fromRGBO(0, 10, 118, 1)),
                            onPressed: () {
                              AppController.instance
                                  .Login(_usuarioController.text,
                                      _senhaController.text)
                                  .then((value) {
                                if (value) {
                                  GoRouter.of(context).pushReplacement('/home');
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              });
                            },
                            child: const Text('Entrar'),
                          ),
                        ],
                      ),
                    )),
              ),
            ])));
  }

  final snackBar = SnackBar(
    content: Text(
      "Email ou senha invalidos",
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );
}
