import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:tracker/screens/home_screen.dart';
import 'package:tracker/screens/login_screen.dart';
import 'package:tracker/screens/transaction_screen.dart';
import 'package:tracker/widgets/navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var isLogoutLoading = false;
  int currentIndex = 0;
var pageViewList = [HomeScreen(), TransactionScreen(),];
  
 


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) { 
           setState(() {
             currentIndex = value;
           });
         },
       ),
      
      body: pageViewList[currentIndex],
    );
  }
}