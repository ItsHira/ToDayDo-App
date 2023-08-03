import 'package:fi_as3_hira/constants/fi_as3_hira_spaces.dart';
import 'package:fi_as3_hira/services/firebase_delete_data.dart';
import 'package:fi_as3_hira/services/firebase_update_data.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckboxExample extends StatefulWidget {
  String workid;
  CheckboxExample({super.key, required this.workid});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;
  String task = "";
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.green;
    }

    return Row(
      children: [
        const Spacer(),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        InkWell(
          onTap: () {
            DataDelete().deleteDataToFirestore(widget.workid);
          },
          child: const SizedBox(
            width: 10,
            child: Icon(
              Icons.delete,
              color: Colors.green,
            ),
          ),
        ),
        Spaces.w20,
        InkWell(
          onTap: () {
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
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              task = message.text;
                              UpdateData()
                                  .updateDataToFirestore(widget.workid, task);
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
          child: const SizedBox(
            width: 10,
            child: Icon(
              Icons.edit,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
