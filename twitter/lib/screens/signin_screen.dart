import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/screens/signup_screen.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }
}

class _SignIn extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
    return Consumer<Auth>(
      builder: (context, state, child) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 60.0),
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png'),
                          fit: BoxFit.cover),
                    ),
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
                  CustomFlatButton(
                      label: 'Submit',
                      onPressed: () async {
                        final result = await state.attemptLogin(
                          _emailController.value.text,
                          _passwordController.value.text,
                        );
                        if (result == Errors.none) {
                          if (!mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const BarMenu()),
                          );
                        } else if (result == Errors.noUserError) {
                          customSnackBar(
                            'No user found for that email!',
                            err: true,
                          );
                        } else if (result == Errors.wrongError) {
                          customSnackBar(
                            'Wrong password!',
                            err: true,
                          );
                        } else if (result == Errors.error) {
                          customSnackBar(
                            'Failed to Login! Please try later',
                            err: true,
                          );
                        }
                      }),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUp()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 35.0),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.blue, fontSize: 18.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ForgetPassword()),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: const Text(
                        'Forget password?',
                        style: TextStyle(color: Colors.blue, fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
