import 'package:flutter/material.dart';

class FavoriteCotacts extends StatelessWidget {
  const FavoriteCotacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'favorite Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
