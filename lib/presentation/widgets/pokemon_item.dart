import 'package:flutter/material.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListTile(
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
