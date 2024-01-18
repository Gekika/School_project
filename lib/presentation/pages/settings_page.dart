import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invest/common/gap.dart';
import 'package:invest/common/static.dart';
import 'package:invest/presentation/pages/privacy.dart';
import 'package:invest/presentation/pages/signin_page.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  File? _selectedImage;
  Color logoutButtonColor = Colors.yellow; // Set your preferred color here

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              profileSection(),
              const VerticalGap10(),
              ElevatedButton(
                onPressed: _signOut,
                style: ElevatedButton.styleFrom(
                  primary: logoutButtonColor, // Use the customizable color
                ),
                child: Text('Logout'),
              ),
              const VerticalGap10(),
              Expanded(
                child: PrivacyPolicyPage(), // Replace the space with PrivacyPolicyPage
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container profileSection() {
    final User? user = FirebaseAuth.instance.currentUser;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: _pickProfilePicture,
                child: Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: _selectedImage != null
                        ? DecorationImage(
                      image: FileImage(_selectedImage!),
                      fit: BoxFit.cover,
                    )
                        : const DecorationImage(
                      image: AssetImage(imgProfile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const HorizontalGap10(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.email ?? 'No email',
                    style: poppinsCaption.copyWith(
                      color: textColor.withOpacity(.75),
                    ),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: _pickProfilePicture,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primaryColor,
              ),
              child: const Icon(
                Icons.edit,
                color: buttonColor,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _pickProfilePicture() async {
    // Show a dialog to allow the user to choose between gallery and camera
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Profile Picture'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.gallery); // Pick image from gallery
              },
              child: Text('Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.camera); // Take a picture with the camera
              },
              child: Text('Camera'),
            ),
          ],
        );
      },
    );
  }

  void _getImage(ImageSource source) async {
    // Use ImagePicker to get the selected image file
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      // Save the image to Firebase Storage and update Firestore collection
      if (FirebaseAuth.instance.currentUser != null) {
        final userId = FirebaseAuth.instance.currentUser!.uid;
        final storageRef = FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');

        try {
          final uploadTask = storageRef.putFile(_selectedImage!);
          await uploadTask.whenComplete(() => null); // Wait until the upload is complete.

          final downloadUrl = await storageRef.getDownloadURL();

          // Use a where query to fetch the specific user document and update the 'profile' field
          final userQuerySnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('uid', isEqualTo: userId)
              .get();

          if (userQuerySnapshot.docs.isNotEmpty) {
            final userDocRef = userQuerySnapshot.docs[0].reference;
            await userDocRef.update({
              'profile': downloadUrl,
            });
          }
        } catch (error) {
          print('Error uploading image: $error');
        }
      }
    }
  }

  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login page after sign out
      Navigator.pushNamed(context, SigninPage.routeName);
    } catch (error) {
      print('Error signing out: $error');
    }
  }
}
