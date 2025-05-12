import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:tonyyyyyy/core/colors_manager.dart';
import 'package:tonyyyyyy/core/util/validators.dart';
import 'package:tonyyyyyy/firebase/firebase_auth_remote_datasource.dart';

import '../../core/routes_manager.dart';
import '../../firebase/firebase_auth_remote_datasource.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Login')),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                validator: (value) => Validators.emailValidation(value??""),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: _obscurePassword,
                validator: (value) => Validators.validatePassword(value??""),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, RoutesManager.forgetten),
                  child: Text('Forgot Password?', style: TextStyle(color: ColorsManager.blue)),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _login(),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    backgroundColor: ColorsManager.blue,
                  ),
                  child: isLoading? Center(child: CircularProgressIndicator(color: ColorsManager.white,)):Text('Login', style: TextStyle(fontSize: 16, color: ColorsManager.white)),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, RoutesManager.register),
                    child: Text('Register Now', style: TextStyle(color: ColorsManager.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> _login() async {
    if (isLoading) return;
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuthRemoteDatasource remoteDatasource = FirebaseAuthRemoteDatasource();
      var message =  await remoteDatasource.loginUserAccount(
        email: emailController.text,
        password: passwordController.text,
      );
      setState(() {
        isLoading = false;
      });
      if(message.contains("Login Success")) {
        Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
      }else{
        toastification.show(
            context: context,
            title: Text(message),
            alignment: Alignment.topCenter,
            autoCloseDuration: const Duration(seconds: 5),
            style: ToastificationStyle.flat,
            type: ToastificationType.error,);
      }


    }
  }
}
