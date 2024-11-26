import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TudoViewDetails extends StatefulWidget {
  const TudoViewDetails({super.key,required this.id});
final id;
  @override
  State<TudoViewDetails> createState() => _TudoViewDetailsState();
}

class _TudoViewDetailsState extends State<TudoViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text("tudoview details"),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("tudodata")
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
          final tudodetails = snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tudodetails["name"]??"no found",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tudodetails["adress"]??"no found",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
