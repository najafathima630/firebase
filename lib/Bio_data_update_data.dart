import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bio_data_upadate extends StatefulWidget {
  const Bio_data_upadate({super.key, required this.id});
  final id;

  @override
  State<Bio_data_upadate> createState() => _Bio_data_upadateState();
}

class _Bio_data_upadateState extends State<Bio_data_upadate> {
  Future<void> Biodata() async {}
  final form_key = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController addressctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  TextEditingController educationctrl = TextEditingController();
  TextEditingController agectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController numberctrl = TextEditingController();

  String _selectedValue = 'male';
  String _selectedValue1 = 'Female';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(backgroundColor: Colors.red),
      body: SingleChildScrollView(
        child: Form(key: form_key,
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
              //   child: TextFormField(
              //     controller: addressctrl,
              //     decoration: InputDecoration(
              //         hintText: "address",
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10))),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty password";
                    }
                  },
                  controller: passwordctrl,
                  decoration: InputDecoration(
                      hintText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty education";
                    }
                  },
                  controller: educationctrl,
                  decoration: InputDecoration(
                      hintText: "education",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty age";
                    }
                  },
                  controller: agectrl,
                  decoration: InputDecoration(
                      hintText: "age",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Container(
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.grey.shade500, width: 2)),
                      child: Column(
                        children: [
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Gender:",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "male",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1,
                                  ),
                                  child: Radio<String>(
                                    value: 'male',
                                    groupValue: _selectedValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedValue = value!;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  "Female",
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Radio<String>(
                                        value: 'Female',
                                        groupValue: _selectedValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedValue = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty email";
                    }
                  },
                  controller: emailctrl,
                  decoration: InputDecoration(
                      hintText: "email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty phone number";
                    }
                  },
                  controller: numberctrl,
                  decoration: InputDecoration(
                      hintText: "number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("studentdata")
                          .doc(widget.id)
                          .update({
                        "name": namectrl.text,
                        "address": addressctrl.text,
                        "email": emailctrl.text,
                        "number": numberctrl.text,
                        "age": agectrl.text,
                        "password": passwordctrl.text,
                        "education": educationctrl.text,
                        "gender": _selectedValue
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
