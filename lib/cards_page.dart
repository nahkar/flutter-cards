import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Cards')),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    const Text('Title', style: TextStyle(fontSize: 24)),
                    const Row(children: [Icon(Icons.person), Text('Author')]),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.all(26.0),
                      constraints: BoxConstraints(maxWidth: 200, maxHeight: 200, minWidth: 100, minHeight: 100),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius:10)],
                      ),
                      child: const Text('card'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Title', style: TextStyle(fontSize: 24)),
                    const Row(children: [Icon(Icons.person), Text('Author')]),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Button')),
                    ElevatedButton(onPressed: () {}, child: const Text('Button')),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text('Title', style: TextStyle(fontSize: 24)),
                    const Row(children: [Icon(Icons.person), Text('Author')]),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Button')),
                    ElevatedButton(onPressed: () {}, child: const Text('Button')),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text('Title', style: TextStyle(fontSize: 24)),
                    const Row(children: [Icon(Icons.person), Text('Author')]),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {}, child: const Text('Button')),
                    ElevatedButton(onPressed: () {}, child: const Text('Button')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
