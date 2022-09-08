import 'package:flutter/material.dart';

class MoreCatsButton extends StatelessWidget {
  const MoreCatsButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: const FittedBox(
            child: Text(
          'Toque para trazer\n mais gatos :3',
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
