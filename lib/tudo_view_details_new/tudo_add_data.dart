import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tudo_Page2 extends StatefulWidget {
  const Tudo_Page2({super.key});

  @override
  State<Tudo_Page2> createState() => _Tudo_Page2State();
}

class _Tudo_Page2State extends State<Tudo_Page2> {
  Future<void> Tudodata() async {
    FirebaseFirestore.instance
        .collection("tudodata")
        .add({"name": namectrl.text, "adress": addressctrl.text});
  }

  TextEditingController namectrl = TextEditingController();
  TextEditingController addressctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30,left: 30),
            child: TextFormField(
              controller: namectrl,
              decoration: InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: TextFormField(
              controller: addressctrl,
              decoration: InputDecoration(
                  hintText: "address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await Tudodata();
                Navigator.pop(context);
              },
              child: Text("submit "))
        ],
      ),
    );
  }
}
