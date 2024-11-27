import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VegetableView_Details extends StatefulWidget {
  const VegetableView_Details({super.key,this.id});
final id;
  @override
  State<VegetableView_Details> createState() => _VegetableView_DetailsState();
}

class _VegetableView_DetailsState extends State<VegetableView_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      backgroundColor: Colors.blue,
      title: Text("VEGETABLE DETAILS"),
    ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("vegetabledetails")
              .doc(widget.id)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("user found"));
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text("no user data found"));
            }
            final vegeta = snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.black,
                          image: DecorationImage(
                              image: NetworkImage(vegeta["image"]),fit: BoxFit.cover)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      vegeta["name"] ?? "no found",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      vegeta["price"] ?? "no found",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),);
  }
}
