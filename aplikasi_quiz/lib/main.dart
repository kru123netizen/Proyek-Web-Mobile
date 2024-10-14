import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget { // Mendefinisikan kelas LoginPage yang merupakan StatefulWidget
  const LoginPage({super.key}); // Konstruktor untuk LoginPage, menerima key sebagai parameter

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState(); // Mengembalikan instance dari _LoginPageState
}

class _LoginPageState extends State<LoginPage> { // Kelas yang menyimpan state dari LoginPage
  final TextEditingController _usernameController = TextEditingController(); // Kontrol untuk input username

  void _login() { // Fungsi untuk menangani logika login
    String username = _usernameController.text; // Mengambil teks dari _usernameController
    if (username.isNotEmpty) { // Memeriksa apakah username tidak kosong
      Navigator.push( // Menavigasi ke halaman berikutnya
        context, // Konteks dari widget saat ini
        MaterialPageRoute( // Membuat rute baru
          builder: (context) => HomePage(username: username), // Mengirim username ke halaman HomePage
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) { // Metode untuk membangun UI
    return Scaffold( // Struktur dasar aplikasi dengan AppBar dan body
      appBar: AppBar( // Membuat AppBar di bagian atas
        title: const Text('Login'), // Judul dari AppBar
      ),
      body: SingleChildScrollView( // Membuat tampilan scrollable
        child: Padding( // Memberikan padding di sekitar konten
          padding: const EdgeInsets.all(16.0), // Padding sebesar 16 piksel di semua sisi
          child: Column( // Kolom untuk menyusun widget secara vertikal
            mainAxisAlignment: MainAxisAlignment.center, // Mengatur posisi widget di tengah kolom
            children: [
              const SizedBox(height: 50), // Jarak vertikal 50 piksel dari atas
              Image.asset( // Menampilkan gambar dari aset
                'assets/img/corn.jpg', // Path ke gambar
                height: 150, // Tinggi gambar
              ),
              const SizedBox(height: 30), // Jarak vertikal 30 piksel
              const Text( // Menampilkan teks "Login"
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Gaya teks
              ),
              const SizedBox(height: 20), // Jarak vertikal 20 piksel
              TextField( // Input field untuk username
                controller: _usernameController, // Menghubungkan kontroler dengan input
                decoration: const InputDecoration( // Dekorasi untuk input
                  labelText: 'Username', // Label untuk input
                  border: OutlineInputBorder(), // Mengatur border input
                ),
              ),
              const SizedBox(height: 20), // Jarak vertikal 20 piksel
              const TextField( // Input field untuk password
                obscureText: true, // Menyembunyikan teks saat diketik
                decoration: InputDecoration( // Dekorasi untuk input
                  labelText: 'Password', // Label untuk input
                  border: OutlineInputBorder(), // Mengatur border input
                ),
              ),
              const SizedBox(height: 10), // Jarak vertikal 10 piksel
              Align( // Mengatur posisi widget di dalam parent
                alignment: Alignment.centerRight, // Mengatur posisi ke kanan
                child: TextButton( // Tombol untuk "Forgot Password?"
                  onPressed: () {}, // Fungsi yang dijalankan saat tombol ditekan
                  child: const Text(
                    'Forgot Password?', // Teks tombol
                    style: TextStyle(color: Colors.blue), // Gaya teks tombol
                  ),
                ),
              ),
              const SizedBox(height: 10), // Jarak vertikal 10 piksel
              ElevatedButton( // Tombol untuk login
                onPressed: _login, // Fungsi yang dijalankan saat tombol ditekan
                style: ElevatedButton.styleFrom( // Gaya tombol
                  backgroundColor: const Color.fromARGB(
                      255, 45, 45, 251), // Warna tombol Login
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Padding tombol
                ),
                child: const Text(
                  'Login', // Teks tombol
                  style: TextStyle(color: Colors.white), // Gaya teks tombol
                ),
              ),
              const SizedBox(height: 20), // Jarak vertikal 20 piksel
              const Text('Or'), // Teks "Or"
              const SizedBox(height: 10), // Jarak vertikal 10 piksel
              TextButton( // Tombol untuk registrasi
                onPressed: () {}, // Fungsi yang dijalankan saat tombol ditekan
                child: const Text(
                  'Register', // Teks tombol
                  style: TextStyle(color: Colors.blue), // Gaya teks tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget { // Mendefinisikan kelas HomePage yang merupakan StatelessWidget
  final String username; // Menyimpan username yang diterima dari halaman sebelumnya

  // ignore: use_key_in_widget_constructors
  const HomePage({required this.username}); // Konstruktor untuk HomePage, memerlukan parameter username

  @override
  Widget build(BuildContext context) { // Metode untuk membangun UI
    return Scaffold( // Struktur dasar aplikasi dengan AppBar dan body
      appBar: AppBar( // Membuat AppBar di bagian atas
        title: Text('Selamat Datang $username! Selamat Pagi'), // Menampilkan pesan selamat datang dengan username
      ),
      body: SingleChildScrollView( // Membuat tampilan scrollable
        child: Column( // Kolom untuk menyusun widget secara vertikal
          crossAxisAlignment: CrossAxisAlignment.center, // Mengatur widget di dalam kolom agar terpusat
          children: [
            Image.asset(
                'assets/img/Foto restoran.jpg'), // Menampilkan gambar restoran dari aset
            const SizedBox(height: 20), // Jarak vertikal 20 piksel
            Padding( // Memberikan padding di sekitar konten
              padding: const EdgeInsets.symmetric(horizontal: 20), // Padding horizontal 20 piksel
              child: Column( // Kolom untuk menyusun menu
                crossAxisAlignment: CrossAxisAlignment.center, // Mengatur widget di dalam kolom agar terpusat
                children: [
                  const Text( // Teks "Menu Hari Ini"
                    'Menu Hari Ini',
                    style: TextStyle(
                      fontSize: 18, // Ukuran font
                      fontWeight: FontWeight.bold, // Gaya font tebal
                    ),
                  ),
                  const SizedBox(height: 10), // Jarak vertikal 10 piksel
                  _buildMenuItem('Noodle', 'assets/img/foto Mi.jpg', 23000), // Memanggil fungsi untuk item menu Noodle
                  _buildMenuItem(
                      'Chicken', 'assets/img/foto ayam goreng.jpg', 15000), // Memanggil fungsi untuk item menu Chicken
                  _buildMenuItem('French Fries',
                      'assets/img/foto kentang goreng.jpg', 11000), // Memanggil fungsi untuk item menu French Fries
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, String imageAsset, int price) { // Fungsi untuk membangun item menu
    return ListTile( // Widget untuk menampilkan item dalam daftar
      leading: Image.asset(imageAsset), // Gambar di sebelah kiri
      title: Text(title), // Judul item menu
      trailing: Text('Rp $price'), // Harga item menu di sebelah kanan
    );
  }
}

