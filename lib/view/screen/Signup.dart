import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

// import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _PickImageState();
}
class _PickImageState extends State<Signup> {
  Uint8List? _image;
  File? selectedIMage;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width:double.infinity,
        height:double.infinity,
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                  children: [
                    const SizedBox(height: 60),
                    Center(

                      child:  Stack(

                        children: [
                          _image != null
                              ? CircleAvatar(
                              radius: 80, backgroundImage: MemoryImage(_image!))
                              : const CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                          ),
                          Positioned(
                              bottom: -0,
                              left: 110,
                              child: CircleAvatar(
                                child: IconButton(

                                    onPressed: () {
                                      showImagePickerOption(context);
                                    },
                                    icon: const Icon(Icons.add_a_photo,)
                                ),
                              ))

                        ],
                      ),
                    ),

                  ]
              ),
              Column(
                children: [const SizedBox(
                  height: 70,
                  width: double.infinity,
                ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(66),
                    ),
                    width: 320,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                        onChanged: (String value){
                          print(value);
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 23
                          ),
                          hintText: "اسم المستخدم :",
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(66),
                ),
                width: 320,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (String value){
                    print(value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      suffix: Icon(
                        Icons.visibility,
                        color: Colors.black,
                        size: 20,
                      ),
                      icon: Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 19,
                      ),
                      hintText: "كلمة المرور :",
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(66),
                ),
                width: 320,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (String value){
                    print(value);
                  },
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 20,
                      ),
                      hintText: "عنوان البريد الإلكتروني :",
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(66),
                ),
                width: 320,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (String value){
                    print(value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black,
                        size: 20,
                      ),
                      hintText: "رقم الهاتف :",
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Login");
                },

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 130, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                ),
                child: const Text(
                  "login",
                  style: TextStyle(fontSize: 24),
                ),
              ),



            ],
          ),
        ),
      ),

    );

  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}


