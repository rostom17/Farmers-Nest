import 'package:farmers_nest/core/color_pallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final RegExp emailChekcer = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _showPass = false;

  void _toggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final UserCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: _emailTEC.text.trim(),
              password: _passwordTEC.text,
            );
        if (UserCredential.user?.uid != null) {
          Get.offAllNamed("/");
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("${e.message}")));
      }
    }
  }

  @override
  void dispose() {
    _emailTEC.dispose();
    _passwordTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * .2),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 32),
                _buildLoginField("Email", _emailTEC),
                const SizedBox(height: 20),
                _buildLoginField("Password", _passwordTEC),
                const SizedBox(height: 32),
                ElevatedButton(onPressed: login, child: Text("Login")),
                const SizedBox(height: 32),
                _buildDivider(context),
                const SizedBox(height: 32),
                _buildSignInWithGoogleButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/registrationScreen");
              },
              child: Text(
                "Register",
                style: TextStyle(color: ColorPallet.mainColorTheme),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlinedButton _buildSignInWithGoogleButton() {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.google),
          const SizedBox(width: 10),
          Text("Sign In With Google"),
        ],
      ),
    );
  }

  Row _buildDivider(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Text("Or", style: Theme.of(context).textTheme.titleSmall),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildLoginField(String label, TextEditingController controller) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        suffixIcon:
            label == "Password"
                ? IconButton(
                  onPressed: _toggleShowPass,
                  icon: _showPass ? Icon(Iconsax.eye) : Icon(Iconsax.eye_slash),
                )
                : null,
      ),
      obscureText: label == "Password" && !_showPass ? true : false,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return "$label can't be empty";
        } else if (label == "Email" && emailChekcer.hasMatch(value!) == false) {
          return "Enter valid $label";
        } else {
          null;
        }
      },
    );
  }
}
