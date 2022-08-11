import 'package:flutter/material.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {});
    _emailController.addListener(() {});
    _passwordController.addListener(() {});
    _confirmController.addListener(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                ),
                CustomEntryField(
                  hint: 'Confirm password',
                  controller: _confirmController,
                ),
                CustomFlatButton(
                  label: 'Submit',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
