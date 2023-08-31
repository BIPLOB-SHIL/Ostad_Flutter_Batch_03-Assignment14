import 'package:assignment/first_page.dart';
import 'package:assignment/second_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Match List"),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:  [
            ListTile(
              title: const Text("Arg vs Africa",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
              trailing: IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) =>const FirstPage()));

                  }, icon: const Icon(Icons.arrow_forward_ios))
            ),
            ListTile(
                title: const Text("Italy vs Spain",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
                trailing: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) =>const SecondPage()));
                    }, icon: const Icon(Icons.arrow_forward_ios))
            ),

          ],
        ),
      )

    );
  }
}
