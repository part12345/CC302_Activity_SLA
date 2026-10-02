import 'package:flutter/material.dart';

// Custom class
class Fruit {
  // Property
  String name;

  // Constructor
  Fruit({
    required this.name,
  });
}

void main() {
  runApp(const MyApp());
}

// Main application widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List of fruits
  List<Fruit> fruits = [
    Fruit(name: 'Apple'),
    Fruit(name: 'Grape'),
    Fruit(name: 'Orange'),
    Fruit(name: 'Kiwi'),
    Fruit(name: 'Pineapple'),
    Fruit(name: 'Raspberry'),
    Fruit(name: 'Watermelon'),
  ];

  // Delete function
  void deleteFruit(Fruit fruit) {
    setState(() {
      fruits.remove(fruit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruit List'),
          centerTitle: true,
        ),

        body: ListView.builder(
          itemCount: fruits.length,

          itemBuilder: (context, index) {
            final fruit = fruits[index];

            return Card(
              child: ListTile(
                title: Text(fruit.name),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Shopping cart button
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Color.fromARGB(255, 197, 224, 46),
                      ),

                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${fruit.name} added to cart!',
                            ),
                          ),
                        );
                      },
                    ),

                    // Delete button
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),

                      onPressed: () {
                        deleteFruit(fruit);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
