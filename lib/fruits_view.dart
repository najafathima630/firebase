import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'fruits_add_data_page.dart';
import 'fruits_upadate_data.dart';

class Fruits_Main extends StatefulWidget {
  const Fruits_Main({super.key});

  @override
  State<Fruits_Main> createState() => _Fruits_MainState();
}

class _Fruits_MainState extends State<Fruits_Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "FRUITS COLLECTION",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("fruitsdata").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return Center(child: Text("no data found"));
              }
              var fruits = snapshot.data!.docs;
              return ListView.builder(
                itemCount: fruits.length,
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
                                  fruits[index]["name"],
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
                                              left: 250),
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return Fruits_UpadateData(
                                                      id: fruits[index].id);
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
                                                  .collection("fruitsdata")
                                                  .doc(fruits[index].id)
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
                            //       fruits[index]["rate"],
                            //       style: TextStyle(
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.bold),
                            //     )
                            //   ],
                            // ),
                            Row(
                              children: [
                                Text(
                                  fruits[index]["size"],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
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
                  return Fruits_AddDataPage();
                },
              ));
            },
          ),
        ),
      ]),
    );
  }
}
