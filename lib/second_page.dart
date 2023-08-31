import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Italy vs Spain"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('football')
              .doc('Italy_vs_Spain')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          //  print(snapshot.data?.data());
            final score = snapshot.data!;
            return SizedBox(
              width: double.infinity,
              height: 170,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(score.get('match_name'),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                      Text(score.get('number_of_goals'),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      Text("Running Time: ${score.get('running_time')}",style: const TextStyle(fontSize: 20,),),
                      Text("Total Time: ${score.get('total_time')}",style: const TextStyle(fontSize: 20,),),
                    ],
                  ),
                ),

              ),
            );
          }),
    );
  }
}
