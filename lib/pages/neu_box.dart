import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget{
  final Widget? child;

  const NeuBox({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        
      ),
      child: child,
    );
  }
}