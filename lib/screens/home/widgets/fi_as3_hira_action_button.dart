import 'package:flutter/material.dart';

import '../../../constants/fi_as3_hira_spaces.dart';
import '../../../servies/fi_as3_hira_write_data.dart';

class ActionButton extends StatefulWidget {
  //  bool isChecked = false;
   ActionButton({super.key});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  String task = "";
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          builder: (BuildContext Context) {
            return SizedBox(
              height: 400,
              width: 400,
              child: Column(
                children: [
                  Spaces.h20,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                      Spaces.w10,
                      SizedBox(
                        width: 230,
                        child: TextField(
                          controller: message,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Type Something...',
                            hintStyle: TextStyle(color: Colors.green),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green)),
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          task = message.text;
                          Write().addData(
                            task,false
                          );
                          Navigator.pop(context);
                          setState(() {
                            message.clear();
                          });
                        },
                        shape: const CircleBorder(),
                        color: Colors.green,
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 33,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      backgroundColor: Colors.white,
      label: const Icon(
        Icons.add,
        color: Colors.green,
      ),
    );
  }
}
