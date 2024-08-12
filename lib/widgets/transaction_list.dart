import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tracker/widgets/transaction_card.dart';

class TransactionList extends StatelessWidget {
  TransactionList({super.key, required this.category, required this.type, required this.monthYear});

  /*Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
           children: [
                    Text("Recent Transactions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                 ],
                ),
                RecentTransactionsList()
              
      ],
      ),
    );
    
  }
}

class RecentTransactionsList extends StatelessWidget {
   RecentTransactionsList({
    super.key,
  });*/
   final userId = FirebaseAuth.instance.currentUser!.uid;

   final String category;
   final String type;
   final String monthYear;
   


  @override
  Widget build(BuildContext context) {
    Query query = FirebaseFirestore.instance
      .collection("users")
      .doc(userId)
      .collection("transactions")
      .orderBy("timestamp",descending: true)
      .where('monthYear', isEqualTo: monthYear)
      .where('type', isEqualTo:"" );

      if(Category != 'All'){
          query = query.where('category', isEqualTo: category);
      }

       return FutureBuilder<QuerySnapshot>(
         future: query.limit(150).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        
        else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No transaction found"));
        }
         var data= snapshot.data!.docs;
        



    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        var cardData = data[index];
      return TransactionCard(
        data: cardData,);
    });
   } );
  }
}