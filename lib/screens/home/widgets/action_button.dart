import 'dart:io';

import 'package:fi_as3_hira/services/firebase_write_data.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import '../../../constants/fi_as3_hira_spaces.dart';
import '../../../utils/utilities.dart';

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  File? _image;
  bool loading = false;

  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Reference databaseRef = FirebaseStorage.instance.ref('data');
  String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();

  Future imageGetGallery() async {
    final PickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(
      () {
        if (PickedFile != null) {
          _image = File(PickedFile.path);
        } else {
          debugPrint('no image picked');
        }
      },
    );
  }

  String url = '';
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
              height: 600,
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
                      Spaces.w5,
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
                      Spaces.w10,
                      MaterialButton(
                        onPressed: () {
                          task = message.text;
                          if (url.isEmpty) {
                            Utils().toastMessage('please upload an image');
                            return;
                          }

                          Write().addData(task, false, url);
                          Navigator.pop(context);
                          setState(
                            () {
                              message.clear();
                            },
                          );
                        },
                        shape: const CircleBorder(),
                        color: Colors.green,
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spaces.h25,
                  Center(
                    child: InkWell(
                      onTap: () async {
                        imageGetGallery();
                        firebase_storage.Reference ref = firebase_storage
                            .FirebaseStorage.instance
                            .ref(uniqueFileName);
                        firebase_storage.UploadTask uploadTask =
                            ref.putFile(_image!.absolute);
                        final snapshot = await uploadTask;
                        final downloadUrl = await snapshot.ref.getDownloadURL();

                        setState(
                          () {
                            url = downloadUrl;
                          },
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.green),
                        ),
                        child: _image != null
                            ? Image.file(_image!.absolute)
                            : const Icon(
                                Icons.photo,
                                color: Colors.green,
                              ),
                      ),
                    ),
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

