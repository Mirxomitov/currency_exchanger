import 'package:flutter/material.dart';

class FailView extends StatelessWidget {
  final String errorMessage;

  const FailView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
      ),
    );
  }
}
