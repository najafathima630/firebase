import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Vegitable/vegetable_update.dart';
import 'package:firebase/Vegitable/vegetable_view_details.dart';
import 'package:firebase/Vegitable/vegitable_add_data.dart';
import 'package:flutter/material.dart';

class Vegitable_View extends StatefulWidget {
  const Vegitable_View({super.key});

  @override
  State<Vegitable_View> createState() => _Vegitable_ViewState();
}

class _Vegitable_ViewState extends State<Vegitable_View> {
  TextEditingController searchctrl = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Product List'),
      ),
      body: Column(
        children: [
          // Search TextField
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Product',
                hintText: 'search',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase(); // Update search query
                });
              },
            ),
          ),
          Expanded(
            // StreamBuilder to fetch data
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('vegetabledetails')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No products found.'));
                }

                // Filter products based on search query
                final filteredProducts = snapshot.data!.docs.where((doc) {
                  final productName = doc['name'].toString().toLowerCase();
                  return productName.contains(searchQuery);
                }).toList();

                return ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[
                        index]; //index call cheyyan vendi use cheyyunnu
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product['image'] ??
                            ''), //index mukalill declare cheyythintund ath kond index call cheyyand evida
                      ),
                      title: Text(product['name']),
                      subtitle: Text('\$${product['price']}'),
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
                    return VegitableAddData();
                  },
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
