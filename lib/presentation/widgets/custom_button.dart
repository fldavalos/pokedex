import 'package:flutter/material.dart';

// modificaciones para widget testing
// el boton debe recibir el bloc provider via constructor en el onTap function
class CustomButton extends StatelessWidget {
  final Function onTap;

  const CustomButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () => onTap(),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              "Get Advice",
            ),
          ),
        ),
      ),
    );
  }
}
