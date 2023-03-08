import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.redAccent,
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
