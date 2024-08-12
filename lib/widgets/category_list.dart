// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:intl/intl.dart';
import 'package:tracker/utils/icons_list.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final ValueChanged<String?> onChanged;


  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String currentCategory = "";
  List<Map<String, dynamic>> categoryList = [];
  
  final scrollController = ScrollController();
  var appIcons = AppIcons();

  @override
  void initState(){
    super.initState();
    setState(() {
      categoryList = appIcons.homeExpensesCategories;
       categoryList.insert(0, addCat);
    });
    
  
  }
  // scrollToSelectedMonth(){
   // final selectedMonthIndex = months.indexOf(currentMonth);
   // if(selectedMonthIndex != -1){
    //  final scrollOffset = (selectedMonthIndex * 100.0) -170;
    //  scrollController.animateTo(scrollOffset,
      // duration: Duration(milliseconds: 500), curve: Curves.ease);
   // }
   //}
   

  @override
  Widget build(BuildContext context) {
   // appIcons.homeExpensesCategories.insert(0, addCat);
    return Container(
      height: 45,
      child: ListView.builder(
        controller:scrollController ,
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          var data = categoryList[index];
        return GestureDetector(
          onTap : (){
            setState(() {
              currentCategory =  data['name'];
              widget.onChanged(data['name']);
            });
           // scrollToSelectedMonth();
          },
          child: Container(
            
            margin: EdgeInsets.all(6),
            padding: EdgeInsets.only(left:10, right:10),
            decoration: BoxDecoration(
              color:currentCategory == data['name']
             ? Colors.blue.shade900
             :  Colors.blue.withOpacity(0.1),
            
             borderRadius: BorderRadius.circular(20),
            ),
            child:  Center(
              child: Row(
              children: [
                Icon(data['icon'],size: 15,color: currentCategory == data['name']? Colors.white :Colors.blue.shade900,),
                SizedBox(width: 10,),
                Text(data['name'],style : TextStyle(
                  color : currentCategory == data['name']
                 ? Colors.white
                 :  Colors.blue.shade900,
                )),
              ],
            )),
          ),
        );
      }),
    );
  }
}