import 'package:cargoship/screens/detail_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cargoship/models/item.dart';
import 'package:cargoship/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:cargoship/models/cargo_container.dart';
import 'package:cargoship/screens/detail_item.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Future<List<Item>> fetchItem() async {
      final request = context.watch<CookieRequest>();
      var response = await request.get('http://127.0.0.1:8000/json-item/');

      // melakukan konversi data json menjadi object Product
      List<Item> list_item = [];
      for (var d in response) {
          if (d != null) {
              list_item.add(Item.fromJson(d));
          }
      }
      return list_item;
  }

    Future<Map<int, String>> fetchContainer() async {
      final request = context.watch<CookieRequest>();
      var response = await request.get('http://127.0.0.1:8000/json-container/');

      // melakukan konversi data json menjadi object Product
      Map<int, String>list_container = {};
      for (var d in response) {
          if (d != null) {
              CargoContainer temp = CargoContainer.fromJson(d); 
              list_container[temp.pk] = temp.fields.name;
          }
      }
      return list_container;
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
          child: Text(
            'List Item',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        ),
        drawer: const CustomDrawer(),
        body: FutureBuilder(
            future: Future.wait([fetchItem(), fetchContainer()]),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data Item.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    List<Item> items = snapshot.data[0];
                    Map<int, String> containerMap = snapshot.data[1];
                    
                    return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                              "${items![index].fields.name}",
                              style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                              ),
                              ),
                              Text("Amount: ${items![index].fields.amount}"),
                              const SizedBox(height: 10),
                              Text("Description: ${items![index].fields.description}"),
                              ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => DetailItemPage(item: items[index], containerName: containerMap[items[index].fields.container]))
                                );
                              }, 
                              child: Text("View Detail"),
                              )
                          ],
                          ),
                      ));
                    }
                }
    }));
  }
}