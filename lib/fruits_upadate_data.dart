import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fruits_UpadateData extends StatefulWidget {
  const Fruits_UpadateData({super.key, required this. id});
final id;
  @override
  State<Fruits_UpadateData> createState() => _Fruits_UpadateDataState();
}

class _Fruits_UpadateDataState extends State<Fruits_UpadateData> {
  TextEditingController namectrl = TextEditingController();
  TextEditingController ratectrl = TextEditingController();
  TextEditingController sizectrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.only(top: 100),
      child: ElevatedButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection("studentdata")
                .doc(widget.id)
                .update({
              "name": namectrl.text,
              "address": ratectrl.text,
              "password": sizectrl.text,

            });
            Navigator.of(context).pop();
          },
          child: Text("update ")),
    ),);
  }
}
