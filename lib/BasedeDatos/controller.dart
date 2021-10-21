import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("Platillo");

//**Select**
void getDatos() async {
  QuerySnapshot usuarios = await collectionReference.get();
  if (usuarios.docs.length != 0) {
    for (var documentos in usuarios.docs) {
      print(documentos.data());
    }
  }
}

//**insert**
void InsertarDato(String valor1, String valor2) async {
  return collectionReference
      .add({
        "Nombre": valor1,
        "Importe": valor2,
      })
      .then((value) => print("Registro agregado"))
      .catchError((error) => print("Fallo en insertar registro:$error"));
}
