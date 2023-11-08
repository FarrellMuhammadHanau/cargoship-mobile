import 'package:flutter/material.dart';

class Item {
  final String name;
  final IconData icon;

  Item(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  final Item item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell (
        onTap: () {
          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final List<Item> items = [
    Item("Lihat Item", Icons.checklist),
    Item("Tambah Item", Icons.add),
    Item("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CargoShip",
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center (
        child: GridView.count(
          primary: true,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: items.map((Item item) {
            return ItemCard(item);
          }).toList(),
        ),
      ),
    );
  }
}