import 'package:flutter/material.dart';
import 'package:projefct/user/address/address.dart';

class shippingaddress extends StatefulWidget {
  const shippingaddress({super.key});

  @override
  State<shippingaddress> createState() => _shippingaddressState();
}

class _shippingaddressState extends State<shippingaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Shipping Address'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 241, 240, 240),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 1,
                          )
                        ],
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text('Home'),
                      subtitle: Text('kannur,670571,kerala'),
                      trailing: Radio(
                          value: "radio value",
                          groupValue: "group value",
                          onChanged: (value) {
                            print(value); //selected value
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 241, 240, 240),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 1,
                          )
                        ],
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text('Home'),
                      subtitle: Text('kannur,670571,kerala'),
                      trailing: Radio(
                          value: "radio value",
                          groupValue: "group value",
                          onChanged: (value) {
                            print(value); //selected value
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 241, 240, 240),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            spreadRadius: 1,
                          )
                        ],
                        border: Border.all(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text('Home'),
                      subtitle: Text('kannur,670571,kerala'),
                      trailing: Radio(
                          value: "radio value",
                          groupValue: "group value",
                          onChanged: (value) {
                            print(value); //selected value
                          }),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 350,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors
                                      .black; // Change to desired color when pressed
                                }
                                return Colors.black; // Default button color
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Myaddress()),
                            );
                          },
                          child: Text("Add new Address"),
                        ),
                      ),
                      Container(
                        width: 350,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {},
                          child: Text("Confirm"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
