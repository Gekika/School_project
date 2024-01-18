import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invest/common/gap.dart';
import 'package:invest/presentation/pages/signup_page.dart';
import 'package:invest/presentation/widgets/navbar_widget.dart';
import 'package:invest/style/color.dart';
import 'package:invest/style/typography.dart';

import '../widgets/encryption_service.dart';
import 'bottomBar.dart';
import 'home_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);
  static const routeName = '/signin-page';

  void _showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPasswordHidden = true;
  bool _isLoading = false; // New boolean variable for loading state

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _signInUser(String email, String password, String username) async {
    setState(() {
      _isLoading = true; // Set loading state to true before sign-in
    });

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If sign-in is successful, you can save the user data to Firestore
      if (userCredential.user != null) {
        String userId = userCredential.user!.uid;

        // Encrypt the password before saving it
        String encryptedPassword = EncryptionService.encrypt(password);

        // Save user data to Firestore with the encrypted password
        saveUserDataToFirestore(userId, email, encryptedPassword, username);

        // Navigate to the home page after successful sign-in
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserNav(),));
      }
    } catch (e) {
      // Handle sign-in errors here
      print("Sign-in Error: $e");

      // Show the error message as a Snackbar
      widget._showErrorSnackbar(context, "Sign-in failed. Please check your credentials.");
    }

    setState(() {
      _isLoading = false; // Set loading state to false after sign-in (whether successful or not)
    });
  }

  void saveUserDataToFirestore(String userId, String email, String password, String username) {
    final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');

    // Save user data to Firestore
    usersCollection.doc(userId).set({
      'email': email,
      'password': password,
      'username': username,
      // Add other user data as needed
      // For example, 'username': user.displayName,
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
                'Sign In',
                style: poppinsH1.copyWith(color: buttonColor, fontSize: 36),
              ),
              Text(
                'Sign in to continue to MONEYWORKS',
                style: poppinsBody1.copyWith(color: textColor),
              ),
              const VerticalGap20(),
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
                      _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
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
                obscureText: _isPasswordHidden ? true : false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),

              const VerticalGap10(),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const VerticalGap20(),
              InkWell(
                onTap: _isLoading // Disable onTap functionality when loading
                    ? null
                    : () {
                  // Get user input from TextFormField fields
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // Call the _signInUser function to authenticate the user
                  _signInUser(email, password, AutofillHints.username,);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: _isLoading ? Colors.grey : buttonColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack( // Use a Stack to overlap loading indicator on the "Sign In" text
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Sign In',
                          style: poppinsH4.copyWith(color: text2Color),
                        ),
                      ),
                      if (_isLoading) // Show loading indicator when _isLoading is true
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(text2Color),
                        ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupPage.routeName);
                    },
                    child: const Text(
                      'Sign Up',
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
