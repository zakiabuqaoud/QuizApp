
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function checkAnswer;
  Answer(this.answerText, this.checkAnswer);



  @override
  Widget build(BuildContext context) {

      return Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: checkAnswer(),
            style: const ButtonStyle(
            ),
            child: Text(answerText, style: const TextStyle(fontSize: 25)),
          )
      );
  }

}
