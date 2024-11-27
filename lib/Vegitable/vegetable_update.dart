import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VegetableUpdate extends StatefulWidget {
  const VegetableUpdate({super.key, this.id});
  final id;
  @override
  State<VegetableUpdate> createState() => _VegetableUpdateState();
}

class _VegetableUpdateState extends State<VegetableUpdate> {
  final form_key = GlobalKey<FormState>();
  Future<void> Vegetable() async {
    FirebaseFirestore.instance.collection("vegetabledetails").add({
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
      appBar: AppBar(title: Text("VEGETABLE UPDATE"),
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
              ),
              Padding(
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
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("vegetabledetails")
                          .doc(widget.id)
                          .update({
                        "name": namectrl.text,
                        "price": pricectrl.text,
                        "image": imagectrl.text,
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text("update ")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
