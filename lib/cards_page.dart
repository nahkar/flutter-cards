import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
        ),
      ),
    );
  }
}
