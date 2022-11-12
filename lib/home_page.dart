import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app2/coompents/answer.dart';
import 'package:quiz_app2/coompents/comp.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<Icon> iconsIndex = [
  //   const Icon(
  //     Icons.check_circle,
  //     color: Colors.green,
  //     size: 28,
  //   ),
  //   const Icon(
  //     Icons.clear,
  //     color: Colors.red,
  //     size: 28,
  //   ),
  // ];
  List<Icon> scoreTracker = [];
  int quetionIndex = 0;
  bool answerScore = false;
  bool asnwerselected = false;
  bool endQuiz = false;
  int totalScoreIndex = 0;

  void asnwertab(bool asnwersed) {
    setState(() {
      asnwerselected = true;
      if (asnwersed) {
        totalScoreIndex++;
      }
      scoreTracker.add(asnwersed
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 28,
            )
          : const Icon(
              Icons.clear,
              color: Colors.red,
              size: 28,
            ));

      if (quetionIndex + 1 == _questions.length) {
        endQuiz = true;
      }
    });
  }

  void nextquetion() {
    setState(() {
      quetionIndex++;
      asnwerselected = false;
      totalScoreIndex++;
    });
    if (quetionIndex >= _questions.length) {
      restQuiz();
    }
  }

  void restQuiz() {
    setState(() {
      quetionIndex = 0;
      scoreTracker = [];
      totalScoreIndex = 0;
      endQuiz = false;
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/images/mario-aceituno-fondo-quiz-v5.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 35),
                child: Row(
                  children: scoreTracker,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 40, right: 20),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "${_questions[quetionIndex]['question']}",
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ...(_questions[quetionIndex]['answers']
                      as List<Map<String, dynamic>>)
                  .map(
                (answer) => Answer(
                  text: answer['answerText'],
                  color: asnwerselected
                      ? answer['score']
                          ? Colors.green
                          : Colors.red
                      : Colors.white,
                  answeredTab: () {
                    if (asnwerselected) {
                      return;
                    }
                    asnwertab(answer['score']);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtom(
                text: endQuiz ? 'Restat Quiz' : 'Next Quetion',
                onPressed: () {
                  if (!asnwerselected) {
                    return;
                  }
                  nextquetion();
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'score :  ${totalScoreIndex} ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final _questions = [
  {
    'question': 'How long is New Zealand’s Ninety Mile Beach?', //0
    'answers': [
      {'answerText': '88km, so 55 miles long.', 'score': true},
      {'answerText': '55km, so 34 miles long.', 'score': false},
      {'answerText': '90km, so 56 miles long.', 'score': false},
    ],
  },
  {
    'question': //1
        'In which month does the German festival of Oktoberfest mostly take place?',
    'answers': [
      {'answerText': 'January', 'score': false},
      {'answerText': 'October', 'score': false},
      {'answerText': 'September', 'score': true},
    ],
  },
  {
    'question': 'Who composed the music for Sonic the Hedgehog 3?', //2
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Timbaland', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
    ],
  },
  {
    'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
    'answers': [
      {'answerText': 'Hamburgers', 'score': false},
      {'answerText': 'Fried chicken', 'score': true},
      {'answerText': 'Pizza', 'score': false},
    ],
  },
  {
    'question':
        'Which part of his body did musician Gene Simmons from Kiss insure for one million dollars?',
    'answers': [
      {'answerText': 'His tongue', 'score': true},
      {'answerText': 'His leg', 'score': false},
      {'answerText': 'His butt', 'score': false},
    ],
  },
  {
    'question': 'In which country are Panama hats made?',
    'answers': [
      {'answerText': 'Ecuador', 'score': true},
      {'answerText': 'Panama (duh)', 'score': false},
      {'answerText': 'Portugal', 'score': false},
    ],
  },
  {
    'question': 'From which country do French fries originate?',
    'answers': [
      {'answerText': 'Belgium', 'score': true},
      {'answerText': 'France (duh)', 'score': false},
      {'answerText': 'Switzerland', 'score': false},
    ],
  },
  {
    'question': 'Which sea creature has three hearts?',
    'answers': [
      {'answerText': 'Great White Sharks', 'score': false},
      {'answerText': 'Killer Whales', 'score': false},
      {'answerText': 'The Octopus', 'score': true},
    ],
  },
  {
    'question': 'Which European country eats the most chocolate per capita?',
    'answers': [
      {'answerText': 'Belgium', 'score': false},
      {'answerText': 'The Netherlands', 'score': false},
      {'answerText': 'Switzerland', 'score': true},
    ],
  },
];
