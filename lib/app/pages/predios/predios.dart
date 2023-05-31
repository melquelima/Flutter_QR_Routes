import 'package:flutter/material.dart';
import 'package:ronda/app/controllers/app_controller.dart';
import 'package:ronda/app/pages/predios/novo_predio.page.dart';

import '../../configs/palette.config..dart';

class Predios extends StatefulWidget {
  const Predios({super.key});

  @override
  State<Predios> createState() => _PrediosState();
}

class _PrediosState extends State<Predios> {
  List<List<String>> itens = [];

  @override
  void initState() {
    super.initState();
    AppController.instance.loadPredios().then((value) {
      setState(() {
        itens = value;
        print("AGORA SIM");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FOII");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NovoPredio()));
        },
        child: const Icon(Icons.add),
      ),
      body: itens.isNotEmpty ? RenderItems(lista: itens) : const LoadingIcon(),
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class RenderItems extends StatelessWidget {
  final List<List<String>> lista;
  final ScrollController listScrollController = ScrollController();

  RenderItems({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        controller: listScrollController,
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return PredioItem(item: lista[index]);
        },
      ),
    );
  }
}

class PredioItem extends StatelessWidget {
  //const PredioItem({super.key});

  final List<String> item;
  PredioItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      //"https://s2.glbimg.com/m4sELSI7M4B_xmLbBsfEz9ESS-c=/smart/e.glbimg.com/og/ed/f/original/2020/09/08/10-predios-mais-altos-brasil-orion-goiania.jpg",
                      "https://i.imgur.com/" + item[2] + ".jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item[0],
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item[1],
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Palette.customBlue.shade600,
                        ),
                        height: 3,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.lock_clock),
                          Text("asdasd"),
                          SizedBox(width: 30),
                          Icon(Icons.label_important),
                          Text("asdasd"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}


// ["Condomonio VP", "Vila Alpina", "uKRGcFE"],
//     ["Predio Pinheiros", "Pinheiros", "pDrBgw9"],
//     ["Condomio do tatu", "Tatuapé", "BheR0n6"],
//     ["Predio Gua", "Guararema", "HWuffaQ"],
//     ["Condomio Corint", "Guarulhos", "uXGNj7n"],
//     ["Predio Catetano", "São Caetano", "5GyyFB3"],