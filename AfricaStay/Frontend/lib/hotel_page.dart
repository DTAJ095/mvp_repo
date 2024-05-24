import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  var hotelList;
  @override
  void initState() {
    super.initState();
    getHotel();
  }
 
  void getHotel() async {
    try {
      var response = await Dio().get('http://192.168.1.118:8000/booking/list/hotels/');
      print(response);
      if (response.statusCode == 200) {
        setState(() {
          hotelList = response.data;
        });
      }
      else {
        print(response.statusCode);
      }
    }
    catch(e) {
      print(e);
    }
  }

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
                      const Text(
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
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          const Icon(
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
              padding: const EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
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
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Implement search functionality
                        },
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search for hotels',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.mic),
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
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card.filled(
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        /*Image.network(hotelList[index]['image']),*/
                        Image.asset('assets/images/hotel2.jpg',),
                        ListTile(
                          title: Text(hotelList[index]['hotel_name']),
                          subtitle: Text(hotelList[index]['location']),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(onPressed: () {
                              Navigator.pushNamed(context, '/hotel_detail');
                            }, child: const Text('View details'))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: hotelList == null?0:hotelList.length,
            ),
            ])
          ],
    );
  }
}
