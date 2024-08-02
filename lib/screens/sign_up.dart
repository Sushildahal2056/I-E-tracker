
import 'package:flutter/material.dart';
import 'package:tracker/screens/homescreen.dart';
import 'package:tracker/screens/login_screen.dart';
import 'package:tracker/services/firebase_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordtwo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var height = media.height;
    var width = media.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            size: 50,
                          )),
                    ),
                    SizedBox(
                      width: 140,
                    ),
                    Container(
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/kukur.png"),
                              fit: BoxFit.fitWidth)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 8, 0),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: height * 0.040,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Full Name",
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Password", prefixIcon: Icon(Icons.lock)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Container(
                    width: 300,
                    child: TextFormField(
                      controller: _passwordtwo,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.325,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(13)),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          if (_passwordController.text == _passwordtwo.text) {
                            try {
                              await FireBaseAuthService()
                                  .SignUp(_emailController.text,
                                      _passwordController.text)
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
                        child: Text(
                          "Signup",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.019),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignIn()));
                    },
                    child: Text("Sign In",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            color: Colors.orange)),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
