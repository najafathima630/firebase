import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/tudo_view_details_new/tudo_add_data.dart';
import 'package:firebase/tudo_view_details_new/tudo_upadte_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tudo_Page1 extends StatefulWidget {
  const Tudo_Page1({super.key});

  @override
  State<Tudo_Page1> createState() => _Tudo_Page1State();
}

class _Tudo_Page1State extends State<Tudo_Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TudoApp"),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("tudodata")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData) {
                      return Center(child: Text("no data found"));
                    }
                    var tudo = snapshot.data!.docs;
                    return ListView.separated(
                      itemCount: tudo.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 20,
                          height: 20,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Card(
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      tudo[index]["name"],
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tudo[index]["adress"],
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 250),
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                  builder: (context) {
                                                    return TudoUpadtePage(
                                                        id: tudo[index].id);
                                                  },
                                                ));
                                              },
                                              icon: Icon(Icons.edit)),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection("tudodata")
                                                  .doc(tudo[index].id)
                                                  .delete();
                                            },
                                            icon: Icon(Icons.delete)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            width: 360,
                            height: 130,
                            color: Colors.red,
                          ),
                        );
                      },
                    );
                  }),
            ),
            FloatingActionButton(
              shape: CircleBorder(side: BorderSide(width: 1)),
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Tudo_Page2();
                  },
                ));
              },
            ),
          ],
        ));
  }
}
