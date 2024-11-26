import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/tudo_view_details_new/tudo_view_details.dart';
import 'package:flutter/material.dart';

import 'tudo_add_data.dart';
import 'tudo_upadte_page.dart';

class TudoView extends StatefulWidget {
  const TudoView({super.key});

  @override
  State<TudoView> createState() => _TudoViewState();
}

class _TudoViewState extends State<TudoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.brown,
          title: Text("Tudo"),
        ),
        body: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("tudodata")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("no data found"));
                }
                var tudo = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: tudo.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: Card(
                          color: Colors.white,
                          child: Container(
                            width: 200,
                            height: 100,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return TudoViewDetails(id:tudo[index].id);
                                      },
                                    ));
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        tudo[index]["name"],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 250,
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
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 260),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return TudoUpadtePage(
                                              id: tudo[index].id);
                                        },
                                      ));
                                    },
                                    icon: Icon(Icons.edit),
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                );
              },
            ),
          ), FloatingActionButton(
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
        ]));
  }
}
