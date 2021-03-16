import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MiApp());

//Primer widget inmutable
class MiApp extends StatelessWidget {
  const MiApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(), //Llamar a funcion mutable
    );
  }
}
//Funcion/widget mutable

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<String> sendData() async {
    //String cadena =
    //    "{ 'NameDevice':'PruebaCosmosDBWorking', 'EventDate':'2021-03-02T11:11:00', 'Event':'EventodePrueba'}";
    //var data = json.encode(cadena);
    var response = await http.post(
        Uri.encodeFull(
            "https://apiproductorlaura.azurewebsites.net/api/data"), //version 0.12.2
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "NameDevice": "PruebaCosmosDBWorking",
          "EventDate": "2021-03-02T11:11:00",
          "Event": "EventodePrueba"
        }));
    print(response.body);
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi App Dark"),
      ),
      body: Center(
        child: new ElevatedButton(
            onPressed: sendData, child: new Text("Enviar datos")),
      ),
    );
  }
}
