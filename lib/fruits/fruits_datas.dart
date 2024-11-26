import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../fruits_upadate_data.dart';
import 'fruits_adddata.dart';
import 'fruits_view_details.dart';

class Fruits_Datas extends StatefulWidget {
  const Fruits_Datas({super.key});

  @override
  State<Fruits_Datas> createState() => _Fruits_DatasState();
}

class _Fruits_DatasState extends State<Fruits_Datas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "FRUITS NAME",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("fruitsdetails")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("no data found"));
                }
                var fruitss = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: fruitss.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: Card(
                          color: Colors.white,
                          child: Container(width: 200,height: 100,
                            child: Column(
                              children: [
                                InkWell(onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context) {
                                    return Fruits_ViewDetails();
                                  },) );
                                },
                                  child: Row(
                                    children: [
                                      Text(
                                        fruitss[index]["name"],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),

                                      ),SizedBox(width: 250,),IconButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection("fruitsdetails")
                                                .doc(fruitss[index].id)
                                                .delete();
                                          },
                                          icon: Icon(Icons.delete)),

                                    ],
                                  ),
                                ),Padding(
                                  padding: const EdgeInsets.only(left: 260),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Fruits_UpadateData(
                                                  id: fruitss[index].id);
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
          ), Padding(
            padding: EdgeInsets.only(left: 250),
            child: FloatingActionButton(
              shape: CircleBorder(side: BorderSide(width: 1)),
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FruitsAdddata();
                  },
                ));
              },
            ),
          ),
        ]));
  }
}
