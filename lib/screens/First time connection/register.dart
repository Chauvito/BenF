import 'package:flutter/material.dart';

import 'info_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final _formKey = GlobalKey<FormState>();

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

@override
void dispose() {
usernameController.dispose();
passwordController.dispose();
super.dispose();
}

void submit() {
  if (_formKey.currentState!.validate()) {
    String username = usernameController.text;
    String password = passwordController.text;
    print("Username: $username");
    print("Password: $password");

// Must do : Send to data server
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoPage(),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Register"),
    ),
    body: SafeArea(
      child: Center(
        child: SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your username";
                      }
                      return null;
                      },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                      },
                  ),

                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: submit,
                      child: const Text("Submit"),
                      //Encrypt password before send it to data server
                      // Must send to database to check whether first connection or not, then decide which page user will access
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}

