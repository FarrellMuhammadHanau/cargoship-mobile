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


# Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

     Methods Navigator.push() digunakan untuk menambahkan halaman baru diatas stack Navigation. Sementara itu, Navigator.pushReplacement() digunakan untuk mengganti halaman pada atas stack Navigation dengan halaman baru. Karena mengganti halaman pada atas stack, maka kita tidak dapat kembali ke halaman lama tersebut saat melakukan Navigation.pop(). Navigator.push() berguna jika ingin user berganti halaman app tetapi masih dapat kembali ke halaman sebelumnya. Sementara itu, Navigator.push() berguna jika ingin user berganti halaman app tetapi tidak dapat kembali ke halaman sebelumnya.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
    - Container: Widget layout dasar yang digunakan untuk mengelompokan dan mengatur tampilan widget lain
    - Row: Widget yang digunakan untuk menyusun widget lain dalam bentuk tumpukan horizontal
    - Column: Widget yang digunakan untuk menyusun widget lain dalam bentuk tumpukan vertikal
    - ListView: Widget yang digunakan untuk menyusun widget lain dalam bentuk list yang dapat di scroll
    - Stack: Widget yang digunakan untuk menyusun widget lain dalam bentuk tumpukkan
    - Expanded: Widget yang widget child nya untuk memperluas dan mengisi ruang yang disediakan oleh widget layout ini
    - Flexible: Widget yang digunakan untuk mengontrol bagaimana child widget mengisi ruang yang tersedia

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
    - TextFormField: Digunakan untuk memasukan nama item, jumlah item, dan deskripsi item. Ketika ketiga form tersebut kosong, maka field tersebut tidak valid dan khusus untuk jumlah item, jika field tersebut diisi dengan selain integer, maka form field tersebut juga tidak valid
    - DropdownButtonFormField: Digunakan untuk memilih kategori item dengan value dari kategori tersebut adalah string. Widget ini digunakan karena kita tidak bisa membuat suatu kategori sesuka kita (sudah ditentukan)

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
    - Flutter menerapkan clean architecture untuk membagi aplikasi menjadi beberapa bagian. Pembagian tersebut diantaranya yaitu:
        + Presentation: Bagian yang berfungsi untuk berinteraksi langsung dengan pengguna. Contoh pada flutter adalah pembuatan halaman dengan widgets, dll.
        + Domain: Bagian yang mengatur logika bisnis dari aplikasi. 
        + Data: Bagian yang berhubungan langsung dengan data

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
    -  Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru sesuai dengan ketentuan 
        + Pada folder lib, buat 2 folder baru yaitu "screens" dan "widgets", lalu pindahkan menu.dart kedalam screens
        + Buat file dalam folder screens dengan nama itemlist_form.dart yang digunakan sebagai form membuat item baru
        + Dalam file tersebut, buat stateful widget baru yaitu "ItemFormPage"
        ```
        class ItemFormPage extends StatefulWidget {
            const ItemFormPage({super.key});

            @override
            State<ItemFormPage> createState() => _ItemFormPageState();
        }
        ```
        + Lalu buat state dari stateful widget tersebut sebagai berikut
        ```
        class _ItemFormPageState extends State<ItemFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _amount = 0;
        String _category = "Consumable";
        String _description = "";
        List<String> categoryList = ['Consumable', 'Tools', 'Electronic', 'Fuel', 'Valuables'];

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Form Tambah Item',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            drawer: const CustomDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Item Name",
                            labelText: "Item Name",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState(() {
                            _name = value!;
                            });
                        },
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                            return "Name not valid!";
                            }
                            return null;
                        },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<String>(
                        value: _category,
                        decoration: InputDecoration(
                            hintText: "Item Name",
                            labelText: "Item Name",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState(() {
                            _category = value!;
                            });
                        },
                        items: categoryList.map((String category) {
                            return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                            );
                        }).toList(),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Amount",
                            labelText: "Amount",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState(() {
                            _amount = int.parse(value!);
                            });
                        },
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                            return "Amount not valid!";
                            }
                            if (int.tryParse(value) == null) {
                            return "Amount must be an integer!";
                            }
                            return null;
                        },
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Description",
                            labelText: "Description",
                            border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState(() {
                            _description = value!;
                            });
                        },
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                            return "Description not valid!";
                            }
                            return null;
                        },
                        ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.indigo),
                            ),
                            
                            child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                            ),
                        ),
                        ),
                    ),
                    ]
                ),
                ),
            ),
            );
        }
        }
        ```
        + Form tersebut meminta input berupa nama item, kategori item, jumlah item, dan deskripsi item
        + Setiap input pada form tersebut juga akan mengecek apakah input tersebut valid atau tidak
    - Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
        + Pada menu.dart pada kelas ItemCard, pada child widget inkwell, tambahkan method Navigation.push() yang akan digunakan untuk mengubah halaman ke halaman tambah item
        ```
        .........
        return Material(
            color: this.item.color,
            child: InkWell (
                onTap: () {
                    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")));
                    if (item.name == "Tambah Item") {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemFormPage()));
                    }
                },
                ........
            )
            ...........
        )
        ```
    - Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
        + Pada widget Eleveted button, tambahkan properti onpressed yang digunakan untuk menambilkan pop up saat ditekan
        + Pada onpressed tersebut akan dicek apakah form valid atau tidak
        ```
        .......
        onPressed: () {
            if (_formKey.currentState!.validate()) {
                showDialog(
                context: context,
                builder: (context) {
                    return AlertDialog(
                    title: const Text('Item Saved'),
                    content: SingleChildScrollView(
                        child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                            Text('Name: $_name'),
                            Text('Amount: $_amount'),
                            Text('Description: $_description'),
                        ],
                        ),
                    ),
                    actions: [
                        TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                        },
                        ),
                    ],
                    );
                },
                );
            }
        }
        ......
        ```
    - Membuat sebuah drawer pada aplikasi dengan ketentuan
        + Membuat file baru pada folder widgets dengan nama drawer.dart
        + Dalam file tersebut buat stateless widget baru dengan nama CustomDrawer yang merupakan widget Drawer
        + Dalam widget tersebut, elemen akan disusun dalam bentuk ListView
        ```
        class CustomDrawer extends StatelessWidget {
            const CustomDrawer({super.key});

            @override
            Widget build(BuildContext context) {
                return Drawer(
                child: ListView(
                    children: [
                    const DrawerHeader(
                        decoration: BoxDecoration(
                        color: Colors.indigo,
                        ),

                        child: Text(
                            'Cargoship',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                            ),
                    ),
                    ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Halaman Utama'),
                        // Bagian redirection ke MyHomePage
                        onTap: () {
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyHomePage(),));
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.add_shopping_cart),
                        title: const Text('Tambah Item'),
                        // Bagian redirection ke ShopFormPage
                        onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemFormPage()));
                        },
                    ),
                    ],
                ),
                );
            }
        }
        ```
        + Ketika halaman utama ditekan, maka akan pindah ke halaman utama dan ketika tambah item ditekan, maka akan pindah ke halaman tambah item
        + Tambahkan CustomDrawer tersebut pada halaman utama dan halaman tambah item pada properti drawer