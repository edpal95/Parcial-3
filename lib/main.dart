import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'BasedeDatos/controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(Crud());
  });
}

class Crud extends StatelessWidget {
  const Crud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CRUD - FireBase",
      home: crudApp(),
    );
  }
}

class crudApp extends StatefulWidget {
  crudApp({Key? key}) : super(key: key);

  @override
  _cudAppState createState() => _cudAppState();
}

class _cudAppState extends State<crudApp> {
//List user = [];
  void initState() {
    super.initState();

    getDatos();
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parcial 3  25-1081-2016'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
            TextField(
              controller: myController2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Importe',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          InsertarDato(myController.text, myController2.text);
          myController.text = "";
          myController2.text = "";
        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
