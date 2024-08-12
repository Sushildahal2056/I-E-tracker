import 'package:flutter/material.dart';
import 'package:tracker/utils/icons_list.dart';

class CategoryDropdown extends StatelessWidget {
   CategoryDropdown({super.key, this.cattype, required this.onChanged});
   final String? cattype;
   final ValueChanged<String?> onChanged;
   var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value:  cattype,
      isExpanded: true,
      hint: Text("Select Category"),
      items: appIcons.homeExpensesCategories
      .map((e) => DropdownMenuItem<String>(
        value: cattype,
        child: Row(
          children: [
            Icon(
              e['icon'],
              color: Colors.black54,
            ),
            SizedBox(width: 10,),
            Text(e['name'], style: TextStyle(color: Colors.black54),),
          ],
        )))
        .toList(),
       onChanged: onChanged);
  }
}