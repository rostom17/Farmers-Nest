import 'package:farmers_nest/core/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool _showPass = false;

  void _toggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: screenHeight * .2),
                Text("Registration", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 32),
                _buildLoginField("Name", _nameTEC),
                const SizedBox(height: 20),
                _buildLoginField("Phone Number", _phoneNumber),
                const SizedBox(height: 20),
                _buildLoginField("Address", _address),
                const SizedBox(height: 20),
                _buildLoginField("Email", _emailTEC),
                const SizedBox(height: 20),
                _buildLoginField("Password", _passwordTEC),
                const SizedBox(height: 32),
                ElevatedButton(onPressed: () {}, child: Text("Register")),
                const SizedBox(height: 32),
                _buildDivider(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already Have account?",
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(color: ColorPallet.mainColorTheme),
              ),
            ),
          ],
        ),
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
        suffixIcon: label == "Password"
            ? IconButton(
                onPressed: _toggleShowPass,
                icon: _showPass ? Icon(Iconsax.eye) : Icon(Iconsax.eye_slash),
              )
            : null,
      ),
      obscureText: label == "Password" && !_showPass ? true : false,
      controller: controller,
      validator: (String? value) {
        if (value?.trim().isEmpty ?? true) {
          return "$label can't be empty";
        } else {
          null;
        }
      },
    );
  }
}
