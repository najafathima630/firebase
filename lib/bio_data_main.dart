import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bio_data_update_data.dart';
import 'Bio_data_update_page.dart';
import 'bio_data_Add_data.dart';

class Bio_DataMain extends StatefulWidget {
  const Bio_DataMain({super.key});

  @override
  State<Bio_DataMain> createState() => _Bio_DataMainState();
}

class _Bio_DataMainState extends State<Bio_DataMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            "BIODATA",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("studentdata")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("no data found"));
                }
                var Student = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: Student.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    Student[index]["name"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 220),
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return Bio_data_upadate(
                                                        id: Student[index]
                                                            .id);
                                                  },
                                                ));
                                              },
                                              icon: Icon(Icons.edit),
                                              color: Colors.pink,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("studentdata")
                                                    .doc(Student[index].id)
                                                    .delete();
                                              },
                                              icon: Icon(Icons.delete)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              // Row(
                              //   children: [
                              //     Text(
                              //       Student[index]["address"],
                              //       style: TextStyle(
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.bold),
                              //     )
                              //   ],
                              // ),
                              Row(
                                children: [
                                  Text(
                                    Student[index]["age"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Student[index]["password"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Student[index]["education"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Student[index]["email"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Student[index]["number"],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    Student[index]["gender"] ,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          )),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 250),
            child: FloatingActionButton(
              shape: CircleBorder(side: BorderSide(width: 1)),
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Bio_Data_AddData();
                  },
                ));
              },
            ),
          ),
        ]));
  }
}
