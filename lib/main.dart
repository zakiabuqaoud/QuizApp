import 'package:flutter/material.dart';
import 'question.dart';
import 'question_and_answers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Quiz App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int totalScore = 0;
  int questionIndex = 0;

  void checkAnswer() {
    setState(() => questionIndex++);
  }

  void restartApp() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  String getAnswer(int questionIndex, int answerIndex) {
    var z = questionsAndAnswers[questionIndex]['answers']
        as List<Map<String, Object>>;
    return z[answerIndex]['answerText'] as String;
  }

  int getScore(int questionIndex, int answerIndex) {

    var z = questionsAndAnswers[questionIndex]['answers']
        as List<Map<String, Object>>;
    checkAnswer();
    return z[answerIndex]['score'] as int;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(10.0),
        child: questionIndex < questionsAndAnswers.length
            ? Column(
                children: [
                  Question(questionsAndAnswers[questionIndex]['questionText']
                      as String),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {
                          totalScore += getScore(questionIndex, 0)
                          },
                        child: Text(getAnswer(questionIndex, 0),
                            style: const TextStyle(fontSize: 25)),
                      )),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {
                          totalScore += getScore(questionIndex, 1)
                        },
                        child: Text(getAnswer(questionIndex, 1),
                            style: const TextStyle(fontSize: 25)),
                      )),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {
                          totalScore += getScore(questionIndex, 2)
                        },
                        child: Text(getAnswer(questionIndex, 2),
                            style: const TextStyle(fontSize: 25)),
                      )),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {
                          totalScore += getScore(questionIndex, 3)
                        },
                        child: Text(getAnswer(questionIndex, 3),
                            style: const TextStyle(fontSize: 25)),
                      )),
                ],
              )
            : Column(children: <Widget>[
                const SizedBox(
                  height: 200,
                ),
                const Text("Done", style: TextStyle(fontSize: 50),),
                Text("your Score is $totalScore from 10", style: const TextStyle(fontSize: 30),),
                ElevatedButton(
                  onPressed: restartApp,
                  child:
                      const Text("Restart App", style: TextStyle(fontSize: 25)),
                ),
              ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
