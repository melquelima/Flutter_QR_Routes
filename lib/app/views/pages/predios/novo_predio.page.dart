import 'package:flutter/material.dart';

import '../../../configs/palette.config..dart';

class NovoPredio extends StatefulWidget {
  const NovoPredio({super.key});

  @override
  State<NovoPredio> createState() => _NovoPredioState();
}

class _NovoPredioState extends State<NovoPredio> {
  final _formkey = GlobalKey<FormState>();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Predio"),
        backgroundColor: Palette.customBlue.shade300,
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      //"https://s2.glbimg.com/m4sELSI7M4B_xmLbBsfEz9ESS-c=/smart/e.glbimg.com/og/ed/f/original/2020/09/08/10-predios-mais-altos-brasil-orion-goiania.jpg",
                      "https://i.imgur.com/uKRGcFE.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: textStyleField('Cidade'),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: textStyleField('Bairro'),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: textStyleField('Logradouro'),
                  controller: _usuarioController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: textStyleField('Descrição'),
                  controller: _usuarioController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: textStyleField('Responsável'),
                  controller: _usuarioController,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Cadastrar"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

InputDecoration textStyleField(String label) {
  return InputDecoration(
    labelText: label,
    filled: true,
    fillColor: Color.fromARGB(255, 255, 255, 255),
    prefixIcon: const Icon(Icons.done),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Palette.customBlue),
    ),
  );
}
