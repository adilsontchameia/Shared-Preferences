import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //Texto da View
  String textoSalvo = "Nada Salvo";
  //Pegar o que vem dos textFields
  TextEditingController _controllerCampo = TextEditingController();
  //Metodo para salvar/recuperar/remover
  //O processo pode levar um tempinho
  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    //Recuperar o objeto que vai permitir manipular
    final prefs = SharedPreferences.getInstance();
    
  }

  _recupperar() {}
  _remover() {}
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
              textoSalvo,
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
