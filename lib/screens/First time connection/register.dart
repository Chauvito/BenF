import 'package:flutter/material.dart';
import 'package:ben_f/services/auth_service.dart';
import 'info_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
final _formKey = GlobalKey<FormState>();
final AuthService authService = AuthService();
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

@override
void dispose() {
usernameController.dispose();
passwordController.dispose();
super.dispose();
}

Future<void> submit() async{
  if (_formKey.currentState!.validate()) {
    return;
  }
    final username = usernameController.text.trim();
    final password = passwordController.text;

    final success = await authService.register(
      username,
      password,
    );

  if (success) {
    print("Account created!");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoPage(),
      ),
    );
    // Navigate to login
  } else {
    print("Registration failed");
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

