import 'package:flutter/material.dart';

import '../models/product_item.dart';

class ProductCard extends StatelessWidget {
  final ProductItem product;
  final bool isBestseller;

  const ProductCard({required this.product, required this.isBestseller, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image with TextButton overlaid
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  product.itemImageUrl,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                ),
              ),
              if (isBestseller)
                Positioned(
                  top: 0,
                  left: 30,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.yellow[800],
                    child: Text(
                      'Bestseller',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              // Positioned TextButton at bottom-right
              Positioned(
                bottom: -7, // Distance from the bottom
                right: 1,  // Distance from the right
                child: TextButton(
                  onPressed: () {
                    // Implement add to cart logic
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.green, width: 1), // Green border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(50, 30), // Width 50px, height 30px
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2), // Reduced padding
                  ),
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ), // Green text
                  ),
                ),
              ),
            ],
          ),
          // Quantity (moved outside Stack since it's not on the image)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start, // Changed to start for quantity only
              children: [
                Text('${product.quantityMl} ml'),
              ],
            ),
          ),
          // Name and Description
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Text(
              product.name,
              style: TextStyle(fontSize: 15),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // Rating and Price
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${product.rating} ★',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      ' (${(1000 * product.rating).toStringAsFixed(0)})',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '8 MINS',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '₹${product.price}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}