import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TudoUpadtePage extends StatefulWidget {
  const TudoUpadtePage({super.key, required this. id});
  final id;

  @override
  State<TudoUpadtePage> createState() => _TudoUpadtePageState();
}

class _TudoUpadtePageState extends State<TudoUpadtePage> {
  Future<void> Tudodata() async {
    print("hello");
    //   FirebaseFirestore.instance
    //       .collection("added_data")

    //   print("successfully");
    // }
  }

  TextEditingController namectrl = TextEditingController();
  TextEditingController addressctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextFormField(
              controller: namectrl,
              decoration: InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextFormField(
              controller: addressctrl,
              decoration: InputDecoration(
                  hintText: "place",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("tudodata")
                      .doc(widget.id)
                      .update(
                          {"name": namectrl.text, "address": addressctrl.text});
                  Navigator.of(context).pop();
                },
                child: Text("update "))
          ],
        ));
  }
}
