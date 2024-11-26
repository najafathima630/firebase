import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  Future<void> Adddata() async {
    print("hello");
    //   FirebaseFirestore.instance
    //       .collection("added_data")
    //       .add({"name": "Noora", "Age": 21});
    //   print("successfully");
    // }

    FirebaseFirestore.instance
        .collection("added_data")
        .add({"name": namectrl.text,"age":agectrl.text});
  }

  TextEditingController namectrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          controller: namectrl,
          decoration: InputDecoration(
              hintText: "name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ), TextFormField(
          controller: agectrl,
          decoration: InputDecoration(
              hintText: "age",
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        ElevatedButton(onPressed: () => Adddata(), child: Text("add ada"))
      ],
    ));
  }
}
