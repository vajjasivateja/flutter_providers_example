import 'package:flutter/material.dart';
import 'package:flutter_providers_example/providers/login_auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginAuthProvider = Provider.of<LoginAuthProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                loginAuthProvider.login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: loginAuthProvider.isLoading
                    ? Center(child: const CircularProgressIndicator(color: Colors.white,))
                    : const Center(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
