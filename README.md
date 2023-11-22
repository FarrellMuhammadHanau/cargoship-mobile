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



# Tugas 9
1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
    Ya, kita dapat melakukan pengambilan data dengan JSON tanpa membuat model terlebih dahulu. Namun, untuk data yang lebih kompleks, lebih baik untuk membuat model terlebih dahulu. Hal ini agar data lebih terstruktur dan mudah dibaca, sehingga lebih mudah untuk diolah dan digunakan.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    CookieRequest berfungsi untuk mengatur dan mengelola cookie permintaan http. Dengan membagikan instance CookieRequest ke semua komponen aplikasi, dimungkinkan untuk melakukan otentikasi dan otorisasi setiap ingin melakukan fitur aplikasi.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
    1. Membuat model item dengan menggunakan website quicktype untuk mengkonversi data json menjadi model flutter.
    2. Menambahkan dependesi http untuk melakukan http request
    3. Membuat fungsi asinkronus yang digunakan untuk melakukan fetch ke website yang diinginkan
    4. Melakukan fetch di dalam fungsi asinkronus tersebut dengan method http.get, lalu hasil dari data fetch tersebut diubah menjadi objek model flutter
    5. Membuat widget FutureBuilder yang digunakan untuk membuat ui berdasarkan fungsi hasil fungsi asynchronus tersebut
    6. Didalam FutureBuilder, tambahkan properti yaitu future yang merupakan data hasil fungsi asynchronus dan builder yang digunakan untuk membangun widget.

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    1. Memasukkan input username dan password
    2. Melakukan http request dengan method post untuk mengirim informasi login ke server django
    3. Django akan melakukan proses autentikasi dan jika valid, server django akan mengirimkan sesi atau token autentikasi
    4. Jika berhasil diautentikasi, maka fitur-fitur flutter yang membutuhkan proses autentikasi dapat diakses

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
    - Future Builder: untuk membuat widget secara asynchronus
    - Sized Box: untuk menyediakan space kosong antar widget
    - MaterialApp: Widget yang dapat digunakan untuk mengatur konfigurasi aplikasi
    - Scaffold: Widget kerangka yang menyediakan bagian app bar dan body
    - Appbar: Widget pada bagian atas Scaffold yang berguna seperti navigation bar dari aplikasi
    - Gridview.count: Widget yang digunakan untuk membuat layout grid sesuai dengan item yang ada
    - Container: Widget yang digunakan untuk mengelompokan dan mengatur tampilan widget lain
    - Padding: Widget yang sama seperti container, yang dapat memberikan padding antara widget child nya
    - Text: Widget yang digunakan untuk menampilkan string teks, seperti nama aplikasi dan nama item
    - Icon: Widget yang digunakan untuk menampilkan ikon item
    - Column: Widget yang digunakan untuk menyusun Item Card dalam bentuk tumpukan vertikal
    - Material: Widget wrapper yang digunakan untuk mengatur desain
    - Container: Widget layout dasar yang digunakan untuk mengelompokan dan mengatur tampilan widget lain
    - Row: Widget yang digunakan untuk menyusun widget lain dalam bentuk tumpukan horizontal
    - Column: Widget yang digunakan untuk menyusun widget lain dalam bentuk tumpukan vertikal
    - ListView: Widget yang digunakan untuk menyusun widget lain dalam bentuk list yang dapat di scroll

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    - Membuat halaman login pada proyek tugas Flutter.
        + Membuat file baru pada lib/screens dengan nama login.dart
        + Menambahkan dependensi seperti berikut
        ```
        flutter pub add provider
        flutter pub add pbp_django_auth
        ```
        + Mengisi file login sebagai berikut
        ```
        import 'package:cargoship/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        void main() {
            runApp(const LoginApp());
        }

        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                title: 'Login',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
            ),
            home: const LoginPage(),
            );
            }
        }

        class LoginPage extends StatefulWidget {
            const LoginPage({super.key});

            @override
            _LoginPageState createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();

            @override
            Widget build(BuildContext context) {
                final request = context.watch<CookieRequest>();
                return Scaffold(
                    appBar: AppBar(
                        title: const Text('Login'),
                    ),
                    body: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                TextField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Username',
                                    ),
                                ),
                                const SizedBox(height: 12.0),
                                TextField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        labelText: 'Password',
                                    ),
                                    obscureText: true,
                                ),
                                const SizedBox(height: 24.0),
                                ElevatedButton(
                                    onPressed: () async {
                                        String username = _usernameController.text;
                                        String password = _passwordController.text;

                                        final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                        'username': username,
                                        'password': password,
                                        });
                            
                                        if (request.loggedIn) {
                                            String message = response['message'];
                                            String uname = response['username'];
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => MyHomePage()),
                                            );
                                            ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                    SnackBar(content: Text("$message Selamat datang, $uname.")));
                                            } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                    title: const Text('Login Gagal'),
                                                    content:
                                                        Text(response['message']),
                                                    actions: [
                                                        TextButton(
                                                            child: const Text('OK'),
                                                            onPressed: () {
                                                                Navigator.pop(context);
                                                            },
                                                        ),
                                                    ],
                                                ),
                                            );
                                        }
                                    },
                                    child: const Text('Login'),
                                ),
                            ],
                        ),
                    ),
                );
            }
        }
        ```
        + Pada projek django, buat app baru dengan nama authentication dengan command python manage.py startapp
        + Pada app authentication, buat fungsi view baru sebagai berikut
        ```
        @csrf_exempt
        def login(request):
            username = request.POST['username']
            password = request.POST['password']
            user = authenticate(username=username, password=password)
            if user is not None:
                if user.is_active:
                    auth_login(request, user)
                    return JsonResponse({
                        "username": user.username,
                        "status": True,
                        "message": "Login sukses!"
                    }, status=200)
                else:
                    return JsonResponse({
                        "status": False,
                        "message": "Login gagal, akun dinonaktifkan."
                    }, status=401)

            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, periksa kembali email atau kata sandi."
                }, status=401)
            
        ```
        + Membuat file urls.py lalu menambahkannya kedalam urls.py tersebut
        ```
        path('login/', login, name='login'),
        ```
        + Membuat fungsi view logout pada file views.py yang sama
        ```
        @csrf_exempt
        def logout(request):
            username = request.user.username

            try:
                auth_logout(request)
                return JsonResponse({
                    "username": username,
                    "status": True,
                    "message": "Logout berhasil!"
                }, status=200)
            except:
                return JsonResponse({
                "status": False,
                "message": "Logout gagal."
                }, status=401)
        ```
        + Menambahkannya ke url
        ```
        path('logout/', logout, name='logout'),
        ```
        + Pada projek flutter, pada lib/screens/menu.dart, ubah fungsi pada properti onTap menjadi asynchronus dan menambahkan sebagai berikut untuk menghandle logout
        ```
        else if (item.name == "Logout"){
            final response = await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
              
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
        ```
    - Membuat model custom sesuai dengan projek django
        + Pada views.py app main, tambahkan 2 fungsi view sebagai berikut untuk mengambil data json yang telah difilter dengan user
        ```
        @csrf_exempt
        def show_json_container(request):
            data = Container.objects.filter(user=request.user)
            return HttpResponse(serializers.serialize("json", data), content_type="application/json")

        @csrf_exempt
        def show_json_item(request):
            data = Item.objects.filter(user=request.user)
            return HttpResponse(serializers.serialize("json", data), content_type="application/json")
        ```
        + Tambahkan pada urls.py sebagai berikut
        ```
        path('json-container/', show_json_container, name='show_json_container'),
        path('json-item/', show_json_item, name="show_json_item")
        ```
        + Buka pada browser url tersebut, lalu copy data json masing-masing
        + Copy ke website quicktype lalu ubah menjadi class model flutter
        + Buat folder models lalu didalamnya buat 2 file baru yaitu item.dart dan cargo_container.dart, lalu mengcopy hasil website quicktype tadi kedalamnya
    - Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
        + Pada lib/screens, buat file baru bernama list_item.dart
        + Didalamnya, buat widget statefull baru yaitu ItemPage dengan statenya _ItemPageState
        + Didalam _ItemPageState, buat 2 fungsi asyncrhonus yaitu fetchItem dan fetchContainer sebagai berikut
        ```
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
        ```
        + Lalu tambahkan beberapa widget untuk menampilkan informasi dari item sehingga isi dari file list_item.dart sebagai berikut
        ```
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
        ```
        + Pada halaman ini akan melakukan fetch dari website django dengan fungsi view yang telah dibuat sebelumnya yaitu
        show_json_item dan show_json_container

    -  Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
        + Buat file baru pada lib/screens dengan nama detail_item.dart
        + Buat kelas statfull widget baru dengan nama DetailItemPage dan statenya yaitu _DetailItemPageState
        + Pada class DetailItemPage, tambahkan attribute 2 attribute yaitu Item dan containerName
        + Pada _DetailItemPageState, tambahkan beberapa widget untuk menampilkan informasi lengkap dari item beserta nama containernya sebagai berikut
        ```
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
        ```