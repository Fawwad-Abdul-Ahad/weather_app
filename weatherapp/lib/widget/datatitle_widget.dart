import 'package:flutter/material.dart';

class DataTitle extends StatelessWidget {
  var data;
  var title;
   DataTitle({super.key,required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(data,style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 6, 143, 255)),),
          Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}