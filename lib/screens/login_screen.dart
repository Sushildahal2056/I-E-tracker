import 'package:flutter/material.dart';
import 'package:tracker/screens/dashboard.dart';
//import 'package:tracker/screens/sign_up.dart';
import 'package:tracker/services/auth_service.dart';
import 'package:tracker/utils/appvalidator.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>(); 
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoader = false;
  var authService = AuthService();

  Future<void> _submitForm() async{
    if (_formkey.currentState!.validate()) {
       setState(() {
        isLoader = true; 
      });
    var data = {  
      
      "email": _emailController.text,
      "password": _passwordController.text,
      
    };
await authService.login(data, context);

       setState(() {
        isLoader = false; 
      });
      //Sca
    }
  }

  var appValidator = AppValidator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 19, 84),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const SizedBox(
                width: 250,
                child: Text(
                  "Login Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Email", Icons.email),
                validator: appValidator.validateEmail,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Password", Icons.lock),
                validator: appValidator.validatePassword,
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent),
                
                onPressed: (){
                  isLoader ? print("Loading") : _submitForm();
                },
                 child:isLoader
                  ? Center(child: CircularProgressIndicator())
                  :Text("Login",
                    style: TextStyle(fontSize: 20)))),
              const SizedBox(height: 30.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
                child: const Text(
                  "Create new account",
                  style: TextStyle(color: Color.fromARGB(255, 170, 166, 163), fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
    return InputDecoration(
      fillColor: const Color(0xAA494A59),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x35949494)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      filled: true,
      labelStyle: const TextStyle(color: Color(0xFF949494)),
      labelText: label,
      suffixIcon: Icon(
        suffixIcon,
        color: const Color(0xFF949494),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
