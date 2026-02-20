import 'package:cards/features/home/presentation/widgets/card_widget.dart';
import 'package:cards/features/home/presentation/widgets/scratch_widget.dart';

import '../widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          GlassHover(),
          ScratchWidget(),
          Text('HomePage', style: TextStyle(fontSize: 20)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              context.push('/movie_list');
            },
            child: Text('Go to Movie List'),
          ),
          
        ],
      ),
    );
  }
}
