import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracker/utils/appvalidator.dart';
import 'package:tracker/widgets/category_dropdown.dart';
import 'package:uuid/uuid.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
 var type = "credit";
 var category = "Others";

 final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
 var isLoader = false;
  var appValidator = AppValidator();
  var amountEditController = TextEditingController();
  var titleEditController = TextEditingController();
  var uid = Uuid();

  Future<void> _submitForm() async{
    if (_formkey.currentState!.validate()) {
       setState(() {
        isLoader = true; 
      });
      final user = FirebaseAuth.instance.currentUser;
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      var amount = int.parse(amountEditController.text);
      DateTime date = DateTime.now();

      var id = uid.v4();
      String monthyear = DateFormat('MMM y').format(date);

      final userDoc = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
      int  remainingAmount = userDoc['remainingAmount'];
      int  totalCredit = userDoc['totalCredit'];
      int  totalDebit = userDoc['totalDebit'];

      if (type == 'Credit'){
        remainingAmount += amount;
        totalCredit += amount;
      }
      else {
         remainingAmount -= amount;
        totalDebit += amount;
      }
      await FirebaseFirestore.instance.collection('users').doc(user!.uid)
      .update({
          "remainingAmount" : remainingAmount,
           "totalCredit" : totalCredit,
            "totalDebit" : totalDebit,
             "updatedAt" : timestamp,
      });

    var data = {  
      
     "id": id,
     "title": titleEditController.text,
    
     "amount": amount,
     "type": type,
     "timestamp": timestamp,
     "totalCredit": totalCredit,
     "totalDebit": totalDebit,
     "remainingAmount": remainingAmount,
     "monthyear": monthyear,
     "category": category,
      
    };
     await FirebaseFirestore.instance.collection('users').doc(user!.uid).collection("transactions").doc(id).set(data);
     Navigator.pop(context);
//await authService.login(data, context);

       setState(() {
        isLoader = false; 
      });
      //Sca
    }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: titleEditController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: appValidator.IsEmptyCheck,
              decoration: InputDecoration(
               labelText: 'Title' 
              ),
            ),
            TextFormField(
              controller: amountEditController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
               labelText: 'Amount' ,
              ),
            ),
            CategoryDropdown(
              cattype: category,
              onChanged: (String? value) { 
                if (value != null)
                {
                  setState(() {
                    category = value;
                  });
                }
               },),
            DropdownButtonFormField(
              value: 'credit',
              items: [
              DropdownMenuItem(child: Text('Credit'), value: 'credit',),
              DropdownMenuItem(child: Text('Debit'), value: 'debit',),
            ], onChanged: (value){
              if(value !=null){
                setState(() {
                type = value;
              });
              }
              
            }),
            SizedBox(height:  18,),
            ElevatedButton(onPressed: (){
              if(isLoader == false){
                  _submitForm();
              }
              
            }, 
            child:
            isLoader ? Center(child: CircularProgressIndicator()):
            Text("Add Transaction")),
          ],
        ),
      ),
    );
      
    
   }
 }
}