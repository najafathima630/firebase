import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fruits_AddDataPage extends StatefulWidget {
  const Fruits_AddDataPage({super.key});

  @override
  State<Fruits_AddDataPage> createState() => _Fruits_AddDataPageState();
}

class _Fruits_AddDataPageState extends State<Fruits_AddDataPage> {
  Future<void> Fruit() async {
    FirebaseFirestore.instance.collection("fruitsdata").add({
      "name": namectrl.text,
      "Price": ratectrl.text,
      "size": sizectrl.text,
    });
  }

  TextEditingController namectrl = TextEditingController();
  TextEditingController ratectrl = TextEditingController();
  TextEditingController sizectrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("FRUITS"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 150, top: 40),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
            child: TextFormField(
              controller: namectrl,
              decoration: InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
          //   child: TextFormField(
          //     controller: ratectrl,
          //     decoration: InputDecoration(
          //         hintText: "price",
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(10))),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
            child: TextFormField(
              controller: sizectrl,
              decoration: InputDecoration(
                  hintText: "size",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ElevatedButton(
                onPressed: () async {
                  await Fruit();
                  Navigator.pop(context);
                },
                child: Text("submit ")),
          )
        ],
      ),
    );
  }
}
