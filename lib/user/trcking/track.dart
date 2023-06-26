import 'package:flutter/material.dart';

class ProductTrackingPage extends StatefulWidget {
  @override
  _ProductTrackingPageState createState() => _ProductTrackingPageState();
}

class _ProductTrackingPageState extends State<ProductTrackingPage> {
  // Simulated tracking data
  String orderNumber = '123456789';
  String currentStatus = 'In Transit';
  List<String> trackingHistory = [
    'Order placed',
    'Order processed',
    'In transit',
    'Out for delivery',
    'Delivered'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Product Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Number: $orderNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Current Status: $currentStatus',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Tracking History:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: trackingHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.check),
                  title: Text(trackingHistory[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
