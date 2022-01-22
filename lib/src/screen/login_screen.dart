import 'package:flutter/material.dart';
import 'package:flutter_review/src/controller.dart';
import 'package:flutter_review/src/mixin/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const Expanded(
              child: SizedBox(),
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                  Container(
                    child: EmailField(),
                  ),
                  Container(
                    child: PasswordField(),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.lightGreen,
                      splashColor: Colors.green,
                      onPressed: () {
                        formKey.currentState?.validate();
                        formKey.currentState?.save();
                      },
                      label: const Text("   Login   "),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget EmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validationEmail,
      onSaved: (email){
        print(email);
      },
    );
  }

  Widget PasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.password),
        hintText: "Password",
      ),
      keyboardType: TextInputType.text,
      validator: validationPassword,
      onSaved: (password){
        print(password);
      },
      obscureText: true,
    );
  }
}