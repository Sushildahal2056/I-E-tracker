import 'package:flutter/material.dart';
import 'package:tracker/widgets/category_list.dart';
import 'package:tracker/widgets/tab_bar_view.dart';
import 'package:tracker/widgets/time_line_month.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansive"),
      ),
      body: Column(
        children: [
          TimeLineMonth(
            onChanged: (String? value){
                if (value != null){
                   setState((){
                      monthYear = value;
                   });
                 
                }
            },
            ),
            CategoryList(
              onChanged: (String? value){
                if (value != null){
                  setState((){
                       category = value;
                  });

                  
                   
                }
              },
            ),
            TypeTabBar(
              category: category, 
              monthYear:monthYear,
             ),
        ],
      ),
    );
  }
}