import 'package:flutter/material.dart';
import 'product_detail_screen.dart'; 

// Class Product (
class Product {
  final String name;
  final double price;
  final IconData icon;
  final String category;

  const Product({
    required this.name,
    required this.price,
    required this.icon,
    required this.category, 
  });
}

// Data Global Produk (Dibuat di luar class ProductListScreen)
const List<Product> allProducts = [
  // MAKANAN
  Product(name: "Burger Enak", price: 25000, icon: Icons.fastfood, category: 'Makanan'),
  Product(name: "Pizza Mini", price: 40000, icon: Icons.local_pizza, category: 'Makanan'),
  Product(name: "Kentang Goreng", price: 15000, icon: Icons.lunch_dining, category: 'Makanan'),
  
  // MINUMAN
  Product(name: "Soda Dingin", price: 10000, icon: Icons.local_drink, category: 'Minuman'),
  Product(name: "Jus Alpukat", price: 18000, icon: Icons.coffee, category: 'Minuman'),
  
  // ELEKTRONIK
  Product(name: "Kamera Pro", price: 8000000, icon: Icons.camera_alt, category: 'Elektronik'),
  Product(name: "Laptop Gaming", price: 15000000, icon: Icons.laptop_windows, category: 'Elektronik'),
];


class ProductListScreen extends StatelessWidget {
  final String selectedCategory;
  const ProductListScreen({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    // 🔥 FIX UTAMA: Filter produk sesuai kategori yang diklik
    final filteredProducts = allProducts.where(
      (product) => product.category == selectedCategory
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory), 
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
            child: Text(
              'Produk $selectedCategory (${filteredProducts.length} item)', // Tunjukkan jumlah
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                childAspectRatio: 0.85, // Disesuaikan agar item Grid bagus
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredProducts.length, // Gunakan produk yang sudah difilter
              itemBuilder: (context, index) {
                final product = filteredProducts[index]; // Ambil produk yang sudah difilter
                
    
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(productData: product), 
                      ),
                    );
                  },
                  child: Card( 
                    elevation: 10, // Naikkan shadow biar kelihatan 3D
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Lebih rounded
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0), // Padding dalam Card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              // Tambah background di area icon biar nggak flat
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Icon(
                                  product.icon, 
                                  size: 60, 
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                            child: Text(
                              product.name,
                              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16), // Lebih bold
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1, 
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                            child: Text(
                              'Rp ${product.price.toStringAsFixed(0)}',
                              style: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.w900, // Paling tebal
                                fontSize: 17, // Lebih besar
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}