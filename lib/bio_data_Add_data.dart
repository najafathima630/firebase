import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bio_data_main.dart';

class Bio_Data_AddData extends StatefulWidget {
  const Bio_Data_AddData({super.key});

  @override
  State<Bio_Data_AddData> createState() => _Bio_Data_AddDataState();
}

class _Bio_Data_AddDataState extends State<Bio_Data_AddData> {
  Future<void> Biodata() async {
    FirebaseFirestore.instance.collection("studentdata").add({
      "name": namectrl.text,
      "adress": addressctrl.text,
      "email": emailctrl.text,
      "number": numberctrl.text,
      "age": agectrl.text,
      "password": passwordctrl.text,
      "education": educationctrl.text,
      "gender": _selectedValue
    });
  }

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
    return Scaffold(backgroundColor: Colors.pink[100],
      appBar: AppBar(backgroundColor: Colors.red,),
      body: Column(
        children: [
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
              controller: agectrl,
              decoration: InputDecoration(
                  hintText: "age",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
            child: TextFormField(
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
              controller: numberctrl,
              decoration: InputDecoration(
                  hintText: "number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
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
                            style: TextStyle(color: Colors.grey, fontSize: 18),
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
          ),Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ElevatedButton(
                onPressed: () async {
                  await Biodata();
                  Navigator.pop(context);
                },
                child: Text("submit ")),
          )
        ],
      ),
    );
  }
}
