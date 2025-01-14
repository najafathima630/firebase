import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Fruits_ViewDetails extends StatefulWidget {
  const Fruits_ViewDetails({super.key, required this.id});
final id;
  @override
  State<Fruits_ViewDetails> createState() => _Fruits_ViewDetailsState();
}

class _Fruits_ViewDetailsState extends State<Fruits_ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("FRUITS DETAILS"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("fruitsdetails")
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
            final fruit = snapshot.data!.data() as Map<String, dynamic>;
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
                              image: NetworkImage(fruit["image"]),fit: BoxFit.cover)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fruit["name"] ?? "no found",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fruit["price"] ?? "no found",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
