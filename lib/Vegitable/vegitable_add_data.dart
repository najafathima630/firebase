import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VegitableAddData extends StatefulWidget {
  const VegitableAddData({super.key});

  @override
  State<VegitableAddData> createState() => _VegitableAddDataState();
}

class _VegitableAddDataState extends State<VegitableAddData> {
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
    return Scaffold(backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("VEGETABLE ADDDATA"),
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
                    onPressed: () async {
                      await Vegetable();
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
