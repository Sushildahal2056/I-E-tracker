import 'package:flutter/material.dart';
//import 'package:tracker/screens/dashboard.dart';
import 'package:tracker/screens/login_screen.dart';
import 'package:tracker/services/auth_service.dart';
//import 'package:tracker/services/auth_service.dart';
import 'package:tracker/utils/appvalidator.dart';

class SignUpView extends StatefulWidget {
   /* TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordtwo = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _username = TextEditingController();*/
  


  SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  final _passwordController = TextEditingController();

  var authService = AuthService();
  var isLoader = false;

  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoader = true; 
      });
    var data = {  
      "username": _userNameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "phone": _phoneController.text,
      'remainingAmount': 0,
      'totalCredit': 0,
      'totalDebit': 0,

    };
await authService.createUser(data, context);
  // Navigator.pushReplacement(
   //   context, 
   //   MaterialPageRoute(builder: (context) => Dashboard()),
   //   );
       setState(() {
        isLoader = false; 
      });
      //ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
       // const SnackBar(content: Text('Form submitted successfully')),
     // );
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
                  "Create new Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _userNameController,
                style: const TextStyle(color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Username", Icons.person),
                validator: appValidator.validateUsername,
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
                controller: _phoneController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Phone number", Icons.call),
                validator: appValidator.validatePhoneNumber,
              ),
              // const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: _buildInputDecoration("Password", Icons.lock),
                validator: appValidator.validatePassword
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
                  :Text("Create",
                    style: TextStyle(fontSize: 20)))),
                  
                  
                  
               
              
            /*  onTap: ()async {

if (_passwordController.text == _passwordtwo.text) {
                            try {
                              await AuthService()
                                  .SignUp(_emailController.text,
                                      _passwordController.text,
                                      _username.text,
                                      int.parse(_phonenumber.text),
                                  
                                      )
                                  .then((value) => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Homescreen())),
                                      });
                            } catch (error) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Unable to login because of $error"),
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("password not same"),
                            ));
                          }
                        



                  
                },
                 SizedBox(height:40.0),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: _submitForm,
                  child: Text("Create" , style: TextStyle(fontSize: 20),),
                ),
              ),*/
              SizedBox(height: 30.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                },
                child:  Text(
                  "Login",
                  style: TextStyle(color: Color(0xFFF15900), fontSize: 25),
                ),
              )
            ],
          )),
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
