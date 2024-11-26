import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FruitsAdddata extends StatefulWidget {
  const FruitsAdddata({super.key});

  @override
  State<FruitsAdddata> createState() => _FruitsAdddataState();
}

class _FruitsAdddataState extends State<FruitsAdddata> {
  final form_key = GlobalKey<FormState>();
  Future<void> fruit() async {
    FirebaseFirestore.instance.collection("fruitsdetails").add({
      "name": namectrl.text,
      "price": pricectrl.text,
      "image": imagectrl.text,
    });
  }

  TextEditingController namectrl = TextEditingController();
  TextEditingController pricectrl = TextEditingController();
  TextEditingController imagectrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty name";
                    }
                  },
                  controller: namectrl,
                  decoration: InputDecoration(
                      hintText: "name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty price";
                    }
                  },
                  controller: pricectrl,
                  decoration: InputDecoration(
                      hintText: "price",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty image";
                    }
                  },
                  controller: imagectrl,
                  decoration: InputDecoration(
                      hintText: "image url",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                    onPressed: () async {
                      await fruit();
                      Navigator.pop(context);
                    },
                    child: Text("submit ")),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
