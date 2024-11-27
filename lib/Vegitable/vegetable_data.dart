import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Vegitable/vegetable_view_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fruits/fruits_adddata.dart';
import '../fruits_upadate_data.dart';

class Vegetable_Data extends StatefulWidget {
  const Vegetable_Data({super.key,this.id});
  final id;

  @override
  State<Vegetable_Data> createState() => _Vegetable_DataState();
}

class _Vegetable_DataState extends State<Vegetable_Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
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
                  .collection("vegetabledetails")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("no data found"));
                }
                var vegeta = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: vegeta.length,
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
                                    return VegetableView_Details(id: vegeta[index].id,);
                                  },) );
                                },
                                  child: Row(
                                    children: [
                                      Text(
                                        vegeta[index]["name"],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),

                                      ),Row(children: [SizedBox(width: 250,),IconButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection("vegetabledetails")
                                                .doc(vegeta[index].id)
                                                .delete();
                                          },
                                          icon: Icon(Icons.delete)),],)

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
                                                  id: vegeta[index].id);
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
