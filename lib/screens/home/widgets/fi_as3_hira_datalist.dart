import 'package:flutter/material.dart';

import '../../../servies/fi_as3_hira_read_data.dart';
import '../../../widgets/designs/fi_as3_hira_checkbox.dart';

class DataList extends StatefulWidget {
  const DataList({super.key});

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  // String work = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 480,
        width: 330,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: StreamBuilder(
          stream: UserProvider.fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final users = snapshot.data!.docs.reversed.toList();
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index].data();
                  final user1 = users[index];
                  // final user2 = users[index].data().values.elementAt(0);
                  // print(user2);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(
                        user['work'],
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: SizedBox(
                          width: 150, child: CheckboxExample(workid: user1.id)),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data found.'),
              );
            }
          },
        ),
      ),
    );
  }
}
