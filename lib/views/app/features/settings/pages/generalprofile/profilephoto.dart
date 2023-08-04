import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smapur/res/assets.dart';
import 'package:smapur/shared/const.dart';
import 'package:smapur/views/app/features/settings/widgets/editprofile.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  File? pickedImage;
  String? photoUrl;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
          source: source, imageQuality: 85, maxWidth: 400, maxHeight: 400);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(image: img);
      setState(() {
        pickedImage = img;
        Navigator.of(context).pop();
      });
      if (await pickedImage!.exists()) {
        photoUrl = await uploadImage();
        setState(() {});
      }
    } on PlatformException {
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File image}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: image.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future<String> uploadImage() async {
    return ""; // Implement Photo Upload in Rest API
  }

  @override
  Widget build(BuildContext context) {
    return EditProfileWidgets(
      content: Center(
        child: Stack(
          children: [
            buildImage(ImageAssets.dummyProfile, () {
              _showModalBottomSheet(context);
            }),
            Positioned(
              bottom: 0,
              right: 4,
              child: InkWell(
                  onTap: () {
                    _showModalBottomSheet(context);
                  },
                  child: buildEditIcon(ConstantsValue.darkBgColor)),
            ),
          ],
        ),
      ),
      lastEdited: '14 Agustus taun 45',
      pageName: 'Profile Photo',
      save: () {},
    );
  }

  Widget buildImage(String imagepath, VoidCallback click) {
    final image = AssetImage(imagepath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: click),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        builder: ((context) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.gallery);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                        fixedSize: const Size(300, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'Pick Image From Gallery',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      await _pickImage(ImageSource.camera);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                        fixedSize: const Size(300, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: const Text(
                      'Pick Image From Camera',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            )));
  }
}
