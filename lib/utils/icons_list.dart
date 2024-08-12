//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  final List<Map<String, dynamic>> homeExpensesCategories = [
          {
            "name": "Gas Filling",
            "icon": FontAwesomeIcons.gasPump,
          },
           {
            "name": "Grocery",
            "icon": FontAwesomeIcons.basketShopping,
          },
           {
            "name": "Milk",
            "icon": FontAwesomeIcons.mugHot,
          },
           {
            "name": "Internet",
            "icon": FontAwesomeIcons.wifi,
          },
           {
            "name": "Electricity",
            "icon": FontAwesomeIcons.bolt,
          },
           {
            "name": "Water",
            "icon": FontAwesomeIcons.water,
          },
           {
            "name": "Rent",
            "icon": FontAwesomeIcons.house,
          },
          {
            "name": "Phone Bill",
            "icon": FontAwesomeIcons.phone,
          },
          {
            "name": "Dining Out",
            "icon": FontAwesomeIcons.utensils,
          },
          {
            "name": "Entertainment",
            "icon": FontAwesomeIcons.film,
          },
          {
            "name": "Healthcare",
            "icon": FontAwesomeIcons.kitMedical,
          },
          {
            "name": "Transportation",
            "icon": FontAwesomeIcons.bus,
          },
          {
            "name": "Clothing",
            "icon": FontAwesomeIcons.shirt,
          },
          {
            "name": "Insurance",
            "icon": FontAwesomeIcons.userShield,
          },
          {
            "name": "Education",
            "icon": FontAwesomeIcons.graduationCap,
          },
          {
            "name": "Others",
            "icon": FontAwesomeIcons.cartPlus,
          },
  ];
  
  IconData getExpenseCategoryIcons(String categoryName){
    final category = homeExpensesCategories.firstWhere(
    (category) => category['name'] == categoryName,
     orElse: () => {"icon": FontAwesomeIcons.basketShopping});
    return category['icon'];
    
  }

}