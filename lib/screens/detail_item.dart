import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cargoship/models/item.dart';
import 'package:cargoship/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:cargoship/models/cargo_container.dart';

class DetailItemPage extends StatefulWidget {
    final Item item;
    final String? containerName;
    const DetailItemPage({super.key, required this.item, required this.containerName});

    @override
    _DetailItemPageState createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
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
        body: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                        "${widget.item.fields.name}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        const SizedBox(height: 10),
                        Text("Contained in ${widget.containerName}"),
                        const SizedBox(height: 10),
                        Text("Owner: ${widget.item.fields.owner}"),
                        const SizedBox(height: 10),
                        Text("Type: ${widget.item.fields.type}"),
                        const SizedBox(height: 10),
                        Text("Amount: ${widget.item.fields.amount}"),
                        const SizedBox(height: 10),
                        Text("Weight: ${widget.item.fields.weight}"),
                        const SizedBox(height: 10),
                        Text("Description: ${widget.item.fields.description}")
                    ],
                ),
        )
    );
  }
}
