import 'package:flutter/material.dart';
import 'package:ronda/app/pages/predios/novo_predio.page.dart';

import '../../configs/palette.config..dart';

class Predios extends StatefulWidget {
  const Predios({super.key});

  @override
  State<Predios> createState() => _PrediosState();
}

class _PrediosState extends State<Predios> {
  final ScrollController listScrollController = ScrollController();
  List<List<String>> itens = [
    ["Condomonio VP", "Vila Alpina", "uKRGcFE"],
    ["Predio Pinheiros", "Pinheiros", "pDrBgw9"],
    ["Condomio do tatu", "Tatuapé", "BheR0n6"],
    ["Predio Gua", "Guararema", "HWuffaQ"],
    ["Condomio Corint", "Guarulhos", "uXGNj7n"],
    ["Predio Catetano", "São Caetano", "5GyyFB3"],
  ];

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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            controller: listScrollController,
            itemCount: itens.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
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
                                "https://i.imgur.com/" +
                                    itens[index][2] +
                                    ".jpg",
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
                                  itens[index][0],
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  itens[index][1],
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
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: const Row(
                                    children: [
                                      Icon(Icons.lock_clock),
                                      Text("asdasd"),
                                      SizedBox(width: 30),
                                      Icon(Icons.label_important),
                                      Text("asdasd"),
                                    ],
                                  ),
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
            },
          ),
        ));
  }
}
