import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String username = 'Username'; // Replace with actual username
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            'assets/images/lb.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // Main content with a scrollable view
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'AfricaStay',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Icon(
                            Icons.account_circle,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.blue,
            ),
            SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          // Implement search functionality
                        },
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for hotels',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.mic),
                        onPressed: () {
                          // Implement voice search functionality
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            _buildHotelInfo(context, 'assets/images/hotel2.jpg', 'Hotel name',
                'Location, Address, Standing'),
            _buildHotelInfo(context, 'assets/images/hotel3.jpg', 'Hotel name',
                'Location, Address, Standing'),
            _buildHotelInfo(context, 'assets/images/hotel4.jpg', 'Hotel name',
                'Location, Address, Standing'),
            _buildHotelInfo(context, 'assets/images/hotel5.jpg', 'Hotel name',
                'Location, Address, Standing'),
            _buildHotelInfo(context, 'assets/images/hotel6.jpg', 'Hotel name',
                'Location, Address, Standing'),
            _buildHotelInfo(context, 'assets/images/hotel6.jpg', 'Hotel name',
                'Location, Address, Standing'),
            _buildHotelInfo(context, 'assets/images/hotel6.jpg', 'Hotel name',
                'Location, Address, Standing'),
          ],
        ),
      ],
    );
  }
  Widget _buildHotelInfo(BuildContext context, String imagePath,
      String hotelName, String details) {
    return SliverPadding(
      padding: EdgeInsets.all(8.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      details,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/detail');
                      },
                      child: Text('View Details'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
