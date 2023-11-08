# Tugas 7

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter

    Dalam flutter, stateless widget adalah widget statis yang tidak memiliki state, dimana widget tersebut tidak dapat mengubah properti internalnya. Sementara itu, stateful widget adalah widget yang memiliki state, dimana state tersebut dapat berubah setelah widget tersebut dibuat. Karena stateless widget bersifat statis, maka stateless widget lebih efisien dibandingkan dengan statefull widget.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing
    - MyApp: Widget stateless yang merupakan aplikasi secara keseluruhan
    - MaterialApp: Widget yang dapat digunakan untuk mengatur konfigurasi aplikasi
    - MyHomePage: Widget stateless yang merupakan laman home dari aplikasi
    - Scaffold: Widget kerangka yang menyediakan bagian app bar dan body
    - Appbar: Widget pada bagian atas Scaffold yang berguna seperti navigation bar dari aplikasi
    - Gridview.count: Widget yang digunakan untuk membuat layout grid sesuai dengan item yang ada
    - ItemCard: Widget stateless yang digunakan untuk menampilkan dan merepresentasikan item
    - Container: Widget yang digunakan untuk mengelompokan dan mengatur tampilan widget lain
    - Padding: Widget yang sama seperti container, yang dapat memberikan padding antara widget child nya
    - Text: Widget yang digunakan untuk menampilkan string teks, seperti nama aplikasi dan nama item
    - Icon: Widget yang digunakan untuk menampilkan ikon item
    - Column: Widget yang digunakan untuk menyusun Item Card dalam bentuk tumpukan vertikal
    - Material: Widget wrapper yang digunakan untuk mengatur desain

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
    - Membuat sebuah program flutter baru dengan tema inventory seperti tugas-tugas sebelumnya
        + Pada command prompt, menjalankan command "flutter create cargoship" untuk membuat project flutter baru dengan nama cargoship
        + Pindah direktori ke folder project cargoship dengan command "cd cargoship"
    - Membuat tiga tombol sederhana dengan ikon dan teks yang memunculkan snackbar ketika ditekan dan tiap tombol memiliki warna yang berbeda
        + Pada folder lib, membuat file baru dengan nama "menu.dart"
        + Pada "menu.dart", mengimport "import 'package:flutter/material.dart';" dan pada "main.dart", mengimport "import 'package:cargoship/menu.dart';"
        + Pada "main.dart" menghapus "_MyHomePageState" lalu memindahkan MyHomePage ke dalam "menu.dart"
        + Mengubah MyHomePage menjadi stateless widget dengan mengubah MyHomePage dari mengextend StatefulWidget menjadi StatelessWidget
        + pada main.dart, mengubah "home: const MyHomePage(title: "Flutter Demo Home Page")," menjadi "home: MyHomePage(),"
        + Pada class MyHomePage, mengubah "const MyHomePage({super.key, required this.title}) menjadi "MyHomePage({Key? key}) : super(key: key);" dan menghilangkan "final String title"
        + Pada "menu.dart", membuat class baru dengan nama Item sebagai berikut
        ```
        class Item {
            final String name;
            final IconData icon;
            final Color color;

            Item(this.name, this.icon, this.color);
            }
        ```
        + Pada "menu.dart", membuat widget stateless baru bernama ItemCard sebagai berikut
        ```
        class ItemCard extends StatelessWidget {
            final Item item;
            const ItemCard(this.item, {super.key});

            @override
            Widget build(BuildContext context) {
                return Material(
                color: this.item.color,
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
        ```
        + Pada MyHomePage, buat attribute baru dengan nama items sebagai berikut
        ```
        final List<Item> items = [
            Item("Lihat Item", Icons.checklist, Colors.indigo),
            Item("Tambah Item", Icons.add, Colors.deepPurple),
            Item("Logout", Icons.logout, Colors.blueAccent),
        ];
        ```
        + Pada MyHomePage, tambahkan method build sebagai berikut
        ```
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
        ```