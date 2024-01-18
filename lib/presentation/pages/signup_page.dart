import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invest/common/gap.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';

import 'bottomBar.dart';
import 'home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPasswordHidden = true;
  bool _isPasswordConfirmationHidden = true;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUpUser(
      String fullName, String username, String email, String password) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        String userId = userCredential.user!.uid;

        saveUserDataToFirestore(userId, fullName, username, email, password);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserNav(),
          ),
        );
      }
    } catch (e) {
      print("Sign-up Error: $e");
    }
  }

  void saveUserDataToFirestore(String userId, String fullName, String username,
      String email, String password) {
    final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

    usersCollection.doc(userId).set({
      'fullName': fullName,
      'username': username,
      'email': email,
      'profile': "",
      'uid': FirebaseAuth.instance.currentUser?.uid,
      'password': password,
    }).then((_) {
      print("User data saved to Firestore successfully!");
    }).catchError((error) {
      print("Error saving user data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Sign Up',
                style: poppinsH1.copyWith(color: buttonColor, fontSize: 36),
              ),
              Text(
                'Join us to continue to MONEYWORKS',
                style: poppinsBody1.copyWith(color: textColor),
              ),
              const VerticalGap20(),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle:
                  poppinsBody1.copyWith(color: textColor.withOpacity(.5)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: buttonColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                style: poppinsBody1.copyWith(color: textColor),
              ),
              const VerticalGap10(),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle:
                  poppinsBody1.copyWith(color: textColor.withOpacity(.5)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: buttonColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                style: poppinsBody1.copyWith(color: textColor),
              ),
              const VerticalGap10(),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle:
                  poppinsBody1.copyWith(color: textColor.withOpacity(.5)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: buttonColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                style: poppinsBody1.copyWith(color: textColor),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const VerticalGap10(),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle:
                  poppinsBody1.copyWith(color: textColor.withOpacity(.5)),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                    child: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: textColor.withOpacity(.5),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: buttonColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                style: poppinsBody1.copyWith(color: textColor),
                obscureText: _isPasswordHidden,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  } else if (value.contains(' ')) {
                    return 'Password must not contain spaces';
                  } else if (value.contains('..')) {
                    return 'Password must not contain double dots';
                  }
                  return null;
                },
              ),
              const VerticalGap10(),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: 'Confirmation Password',
                  hintStyle:
                  poppinsBody1.copyWith(color: textColor.withOpacity(.5)),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isPasswordConfirmationHidden =
                        !_isPasswordConfirmationHidden;
                      });
                    },
                    child: Icon(
                        _isPasswordConfirmationHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: textColor.withOpacity(.5)),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: buttonColor,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                style: poppinsBody1.copyWith(color: textColor),
                obscureText: _isPasswordConfirmationHidden,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const VerticalGap20(),
              InkWell(
                onTap: () {
                  String fullName = _fullNameController.text;
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  _signUpUser(fullName, username, email, password);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: poppinsH4.copyWith(color: text2Color),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account? ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: buttonColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
