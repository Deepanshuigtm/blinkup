import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int itemIndex;
  final void Function(int) onFilter; // Required callback function

  const CustomAppBar({
    Key? key,
    required this.itemIndex,
    required this.onFilter, // Make _onFilter required
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(200);
}
class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFD95A), // Matching the yellow background
      elevation: 0,
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blinkit in ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '18 minutes',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Spacer(),
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.black87, size: 20),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(100), // Height for search bar and tabs
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
            child: Text(
              'Gwalior, Madhya Pradesh, India',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Color(0xFFFFD95A),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search "sunscreen"',
                        hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        suffixIcon: Icon(Icons.mic, color: Colors.grey[600]),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              color: Color(0xFFFFD95A),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          widget.onFilter(index);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              [Icons.local_dining, Icons.forest_outlined, Icons.local_drink_outlined, Icons.icecream, Icons.fastfood][index],
                              color: Colors.black87,
                              size: 24,
                            ),
                            SizedBox(height: 4),
                            Text(
                              ['All', 'Vegetables', 'Drinks', 'Sweet', 'Instant Food'][index],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  Positioned(
                    left: widget.itemIndex * (MediaQuery.of(context).size.width / 5.5),
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: 3,
                      color: Colors.black87,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}