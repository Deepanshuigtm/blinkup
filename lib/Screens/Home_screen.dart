import 'package:blinkup/Widgets/Custom_App_Bar.dart';
import 'package:blinkup/Widgets/Offer_Card.dart';
import 'package:blinkup/models/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/Product_Card.dart';
import '../providers/product_provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _itemIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onFilter(int index) {
    setState(() {
      _itemIndex = index;
    });
  }
  String _getCategoryName(int itemIndex) {
    switch (itemIndex) {
      case 0:
        return 'All Categories';
      case 1:
        return 'Vegetables';
      case 2:
        return 'Cold Drinks & Juices';
      case 3:
        return 'Sweet Tooth';
      case 4:
        return 'Instant & Frozen Food';
      default:
        return 'Unknown Category';
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).loadProductsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.home, size: 24),
                if (_selectedIndex == 0)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 2, color: Colors.black),
                  ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.shopping_bag, size: 24),
                if (_selectedIndex == 1)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 2, color: Colors.black),
                  ),
              ],
            ),
            label: 'Order Again',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.apps, size: 24),
                if (_selectedIndex == 2)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 2, color: Colors.black),
                  ),
              ],
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: <Widget>[
                Icon(Icons.print, size: 24),
                if (_selectedIndex == 3)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 2, color: Colors.black),
                  ),
              ],
            ),
            label: 'Print',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[900],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      appBar: CustomAppBar(itemIndex: _itemIndex, onFilter: _onFilter),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFFFD95A),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Kalam',
                      color: Color(0xFF800000),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Order now to avail exciting offers!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4B0101),
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFFFD95A),
              width: double.infinity,
              child: OfferCard(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 8.0),
              child: Text(
                _getCategoryName(_itemIndex),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Consumer<ProductProvider>(
              builder: (context, provider, _) {
                if (provider.error != null) {
                  return Center(child: Text(provider.error!));
                }

                // Determine the items to display based on _itemIndex
                List<ProductItem> items;
                if (_itemIndex == 0) {
                  // Show all items from all categories
                  items = [
                    ...provider.getByCategory('sweet_tooth'),
                    ...provider.getByCategory('cold_drinks_and_juices'),
                    ...provider.getByCategory('vegetables'),
                    ...provider.getByCategory('instant_and_frozen_food'),
                  ];
                } else if (_itemIndex == 1) {
                  items = provider.getByCategory('vegetables');
                } else if (_itemIndex == 2) {
                  items = provider.getByCategory('cold_drinks_and_juices');
                } else if (_itemIndex == 3) {
                  items = provider.getByCategory('sweet_tooth');
                } else if (_itemIndex == 4) {
                  items = provider.getByCategory('instant_and_frozen_food');
                } else {
                  items = []; // Fallback for invalid _itemIndex
                }

                if (items.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 columns
                    childAspectRatio: 0.42,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: items.length,
                  shrinkWrap: true, // Allows GridView to take only the space it needs
                  physics: NeverScrollableScrollPhysics(), // Disables internal scrolling
                  itemBuilder: (context, index) {
                    final product = items[index];
                    bool isBestseller = [0, 1, 3, 4].contains(index); // Example logic for bestseller
                    return ProductCard(
                      product: product,
                      isBestseller: isBestseller,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}