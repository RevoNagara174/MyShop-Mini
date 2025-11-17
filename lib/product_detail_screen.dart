// lib/product_detail_screen.dart

import 'package:flutter/material.dart';
// Import kelas Product dari file ProductListScreen
import 'product_list_screen.dart'; 

class ProductDetailScreen extends StatelessWidget {
  final Product productData;

  const ProductDetailScreen({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
      ),
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[
            // Icon (product.icon)
            Icon(
              productData.icon, 
              size: 110, // Icon dibuat sedikit lebih besar
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 30),
            
            // Text (product.name)
            Text(
              productData.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32, // Lebih besar dan bold
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            
            // Text (product.price)
            Text(
              'Hanya Rp ${productData.price.toStringAsFixed(0)}',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 50),
            
            // Tombol Kembali yang Stylish
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                   // NAVIGATE BACK
                   Navigator.pop(context); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Warna Teal
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Kembali Belanja',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}