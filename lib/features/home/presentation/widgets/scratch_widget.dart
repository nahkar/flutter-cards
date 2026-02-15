import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class ScratchWidget extends StatelessWidget {
  const ScratchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 120,
      width: 200,
      child: Scratcher(
        brushSize: 30,
        threshold: 50, 
        color: theme.colorScheme.primary.withOpacity(1),
        child: Container(
          height: 300,
          width: 300,
          color: theme.colorScheme.surface,
          alignment: Alignment.center,
          child: Text(
            'IVYS45CS',
            style: theme.textTheme.headlineMedium?.copyWith(color: theme.textTheme.bodyLarge?.color),
          ),
        ),
      ),
    );
  }
}
