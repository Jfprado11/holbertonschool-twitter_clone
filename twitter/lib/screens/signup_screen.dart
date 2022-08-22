import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;
  final GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  customSnackBar(String text, {bool err = false}) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: err ? Colors.red : Colors.blue,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // final snackBarCustom = SnackBar(content: )
    return Consumer<Auth>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.blue,
              onPressed: (() {
                Navigator.of(context).pop();
              }),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              'Sign Up',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      width: 60.0,
                      height: 60.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    CustomEntryField(
                      hint: 'Enter name',
                      controller: _nameController,
                    ),
                    CustomEntryField(
                      hint: 'Enter email',
                      controller: _emailController,
                    ),
                    CustomEntryField(
                      hint: 'Enter password',
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    CustomEntryField(
                      hint: 'Confirm password',
                      controller: _confirmController,
                      isPassword: true,
                    ),
                    CustomFlatButton(
                      label: 'Submit',
                      onPressed: () async {
                        final result = await state.attemptSignUp(
                          _emailController.value.text,
                          _nameController.value.text,
                          _passwordController.value.text,
                          _confirmController.value.text,
                        );
                        if (result == Errors.weakError) {
                          customSnackBar(
                            'The password provided is too weak',
                            err: true,
                          );
                        } else if (result == Errors.matchError) {
                          customSnackBar(
                            'Passwords doesn’t match',
                            err: true,
                          );
                        } else if (result == Errors.existsError) {
                          customSnackBar(
                            'An account already exists with that email',
                            err: true,
                          );
                        } else if (result == Errors.error) {
                          customSnackBar(
                            'Failed to create account! Please try later',
                            err: true,
                          );
                        } else if (result == Errors.none) {
                          customSnackBar('Account Created');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
