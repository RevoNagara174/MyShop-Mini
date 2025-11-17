// lib/main.dart
import 'package:flutter/material.dart';
import 'product_list_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop Mini',
      theme: ThemeData(
        primarySwatch: Colors.teal, 
        useMaterial3: true,
      ),
      home: const HomeScreen(), 
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Makanan', 'icon': Icons.fastfood},
    {'name': 'Minuman', 'icon': Icons.local_drink},
    {'name': 'Elektronik', 'icon': Icons.laptop},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop Mini'), 
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
            child: Text(
              'Jelajahi Kategori Pilihan',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, 
              children: categories.map((category) {
                return Expanded(
                  child: GestureDetector( 
                    onTap: () {
                      // NAVIGATE TO ProductListScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductListScreen(
                            selectedCategory: category['name'] as String,
                          ),
                        ),
                      );
                    },
                    child: Card( // Card Kategori dengan desain baru
                      elevation: 8, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [Colors.teal.shade50, Colors.teal.shade100],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                category['icon'] as IconData,
                                size: 45, 
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                category['name'] as String,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}