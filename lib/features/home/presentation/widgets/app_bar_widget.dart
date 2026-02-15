import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellow,
      title: const Text(
        'Home Page',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          color: Colors.black,
          icon: const Icon(Icons.person),
          onPressed: () {
            context.push('/profile');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
