import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
   String question;
   Question(this.question, {super.key});

    @override
    Widget build(BuildContext context) {
      return Column(
          children: [ Text(
          question,
          style: const TextStyle(fontSize: 20,),
          textAlign:TextAlign.center
          )
      ]);
    }
  }

