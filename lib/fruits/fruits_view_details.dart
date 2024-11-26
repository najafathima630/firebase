import 'package:flutter/material.dart';

class Fruits_ViewDetails extends StatefulWidget {
  const Fruits_ViewDetails({super.key});

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
        padding: const EdgeInsets.only(top: 10,left: 10,bottom: 10),
        child: Card(
          child: Column(
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
                    color: Colors.black,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Apple",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "100",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
