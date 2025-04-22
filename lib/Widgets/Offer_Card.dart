import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF9C4), Color(0xFFFFF9C4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Left Offer
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.currency_rupee, color: Color(0xFFB9770E), size: 28),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Flat ',
                        style: TextStyle(color: Colors.green[900], fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '₹50 OFF',
                        style: TextStyle(color: Colors.green[900], fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'on your order',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  'above ₹299',
                  style: TextStyle(color: Colors.brown, fontSize: 12),
                ),
              ],
            ),

            // Vertical Divider with "+"
            Container(
              height: 60,
              width: 1,
              color: Colors.brown.shade200,
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
            Column(
              children: [
                Icon(Icons.delivery_dining, color: Color(0xFFB9770E), size: 28),
                SizedBox(height: 8),
                Text(
                  'Free Delivery',
                  style: TextStyle(color: Colors.green[900], fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'on all orders',
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
