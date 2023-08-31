import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arg vs Africa"),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('football')
              .doc('Arg_vs_Africa')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
           // print(snapshot.data?.data());
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
                             Text(score.get('match_names'),style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
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
