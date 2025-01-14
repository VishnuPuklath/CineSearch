import 'package:flutter/material.dart';

class EmptySpaceWidget extends StatelessWidget {
  const EmptySpaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off,
              size: 80, color: Colors.white60), // Large icon for emphasis
          const SizedBox(height: 16),
          Text(
            'No movies found.',
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
        ],
      ),
    );
  }
}
