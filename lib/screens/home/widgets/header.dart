import 'package:flutter/material.dart';

import '../../../constants/fi_as3_hira_spaces.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.playlist_add_check,
            color: Colors.white,
            size: 50,
          ),
          title: Text(
            "ToDayDo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Spaces.w20,
            Text(
              '4 Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
