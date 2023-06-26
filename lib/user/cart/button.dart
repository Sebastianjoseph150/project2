import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: decrementQuantity,
          ),
          // SizedBox(width: 2),
          Text(
            quantity.toString(),
            style: TextStyle(fontSize: 15),
          ),
          // SizedBox(width: 2),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: incrementQuantity,
          ),
        ],
      ),
    );
  }
}
