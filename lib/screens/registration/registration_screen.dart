import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:tonyyyyyy/core/colors_manager.dart';
import 'package:tonyyyyyy/core/util/validators.dart';
import 'package:tonyyyyyy/firebase/firebase_auth_remote_datasource.dart';


class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text('Create Account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  validator: (value) => Validators.nameValidation(value ?? ""),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  validator: (value) => Validators.emailValidation(value ?? ""),
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
                  validator: (value) => Validators.validatePassword(value ?? ""),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: _obscurePassword,
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
                SizedBox(height: 16),
                TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) => Validators.rePasswordValidation(value ?? "", passwordController.text),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: _obscureConfirm,
                  decoration: InputDecoration(
                    labelText: 'Re-enter Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirm ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() => _obscureConfirm = !_obscureConfirm);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      _createUserAccount();
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: ColorsManager.blue,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: isLoading
                        ? Center(child: CircularProgressIndicator(color: Colors.white))
                        : Text("Register"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createUserAccount() async {
    if (isLoading) return;
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      FirebaseAuthRemoteDatasource remoteDatasource = FirebaseAuthRemoteDatasource();
     var message =  await remoteDatasource.createUserAccount(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
      setState(() {
        isLoading = false;
      });
      toastification.show(
        context: context,
        title: Text(message),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 5),
        style: ToastificationStyle.flat,
        type: message.contains("Account Created Successfully")? ToastificationType.success: ToastificationType.error,
      );
    }
  }
}
