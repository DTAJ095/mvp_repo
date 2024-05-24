import 'package:flutter/material.dart';

class FlightPage extends StatefulWidget {
  const FlightPage({super.key});

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
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
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card.filled(
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Image.asset('assets/images/hotel2.jpg'),
                        ListTile(
                          title: Text('Item title'),
                          subtitle: Text('Item subtitle'),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(onPressed: () {
                              Navigator.pushNamed(context, '/flight_detail');
                            }, child: Text('View details'))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ])
      ],
    );
  }
}
