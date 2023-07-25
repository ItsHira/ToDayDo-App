import 'package:fi_as3_hira/constants/fi_as3_hira_spaces.dart';
import 'package:fi_as3_hira/screens/fi_as3_hira_login.dart';
import 'package:flutter/material.dart';

class H1Home extends StatelessWidget {
  const H1Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Spaces.h50,
            const ListTile(
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
            const Row(
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
            Spaces.h5,
            SingleChildScrollView(
              child: Container(
                height: 480,
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
              ),
            ),
            Spaces.h40,
            FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: Colors.white,
              label: const Icon(
                Icons.add,
                color: Colors.green,
              ),
            ),
            Row(
              children: [
                Spaces.w10,
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const H1login(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
