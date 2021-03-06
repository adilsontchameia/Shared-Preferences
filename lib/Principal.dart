import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //Texto da View
  String _textoSalvo = "Nada Salvo";
  //Pegar o que vem dos textFields
  TextEditingController _controllerCampo = TextEditingController();
  //Metodo para salvar/recuperar/remover
  //O processo pode levar um tempinho
  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    //Salvar o objeto que vai permitir manipular
    final prefs = await SharedPreferences.getInstance();
    //Salvar / string / bool / int / listaString
    //A chave sera usada para, salvar, recuperar, remover
    await prefs.setString("nome", valorDigitado);

    //Teste para verificar
    print("Salvar: $valorDigitado");
  }

  _recupperar() async {
    String valorDigitado = _controllerCampo.text;
    //Recuperar o objeto que vai permitir manipular
    final prefs = await SharedPreferences.getInstance();
    //Salvar / string / bool / int / listaString
    //Usar a chave para, recuperar
    setState(() {
      //Caso seja nulo, vamos colocar sem valor
      _textoSalvo = prefs.getString("nome") ?? "Sem Valor";
    });

    //Teste para verificar
    print("Recuperar: $_textoSalvo");
  }

  _remover() async {
    //Recuperar o objeto que vai permitir manipular
    final prefs = await SharedPreferences.getInstance();
    if (prefs.remove("nome") != null) {
      print("Removido com Sucesso");
    } else {
      print("Ocorreu um erro ao salvae");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              _textoSalvo,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Digite algo"),
              controller: _controllerCampo,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 30, right: 30)),
                  child: Text("Salvar"),
                  onPressed: _salvar(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 30, right: 30)),
                  child: Text("Vizualizar"),
                  onPressed: _recupperar(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(left: 30, right: 30)),
                  child: Text("Remover"),
                  onPressed: _remover(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
