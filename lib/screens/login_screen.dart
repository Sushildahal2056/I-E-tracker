
import 'package:flutter/material.dart';
import 'package:tracker/screens/sign_up.dart';
import 'package:tracker/services/firebase_services.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      Container(
                        height: height * 0.055,
                        width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/blog.png"),
                                fit: BoxFit.cover)),
                      ),
                      Text(
                        "Let's  watch and upload",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
                    child: Text(
                      "login",
                      style: TextStyle(
                          fontSize: height * 0.067,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Text(
                      'Please sign in to continue',
                      style: TextStyle(height: 1),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
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
                    height: 20,
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
                              hintText: "password",
                              prefixIcon: Icon(Icons.lock)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(170, 0, 0, 0),
                      child: Text(
                        "Forget",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: Colors.orange[500]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          try {
                            await FireBaseAuthService().signin(
                                _emailController.text,
                                _passwordController.text);
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Unable to login because of $error"),
                            ));
                          }
                        },
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.325,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(13)),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.031,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.38,
                      ),
                      CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/facebook.jpg")),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (_)=>loginWithPohnNumber()));
                        },
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage("assets/phone.png"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.019),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => SignUp()));
                          },
                          child: Text("Sign Up",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.019,
                                  color: Colors.orange)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(173, 30, 0, 0),
              child: Container(
                height: height * 0.7,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/girl.png"))),
              ),
            ),
          ],
        ));
  }
}
