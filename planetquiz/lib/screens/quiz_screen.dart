import 'package:flutter/material.dart';
import 'package:planetquiz/models/questions.dart';
import 'package:planetquiz/screens/result_screen.dart';
import 'package:planetquiz/widgets/answer_card.dart';
import 'package:planetquiz/widgets/next_button.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.userName,
    required this.userSurname,
    required this.userRole,
    required this.userRoleIcon,
    this.backgroundImage = 'assets/Abackground.png',
  });

  final String userName;
  final String userSurname;
  final String userRole;
  final IconData userRoleIcon;
  final String backgroundImage;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  List<int> randomQuestionIndices = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    randomQuestionIndices = List.generate(questions.length, (index) => index)
      ..shuffle();
  }

  void playSound(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  void pickAnswer(int value) {
    if (selectedAnswerIndex != null) return;

    selectedAnswerIndex = value;
    final question = questions[randomQuestionIndices[questionIndex]];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
      playSound('assets/sounds/correct_answer.mp3');
    } else {
      playSound('assets/sounds/wrong_answer.mp3');
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < randomQuestionIndices.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    } else {
      playSound('assets/sounds/quiz_end.mp3');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: score),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[randomQuestionIndices[questionIndex]];
    bool isLastQuestion = questionIndex == randomQuestionIndices.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(widget.userRoleIcon), // Ikona po lewej stronie
            SizedBox(width: 10),
            Text(widget.userRole), // Tekst po lewej stronie
            Spacer(), // Dodaje przestrzeń między elementami
            // Tutaj umieszczasz logo po prawej stronie
            Image.asset(
              'assets/AlverniaLogo.png',
              height: 100,
              width: 100,
            ), // Logo po prawej stronie
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            widget.backgroundImage,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit
                .cover, // Zapewnia, że obraz tła będzie pokrywał cały ekran
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 21,
                    color: Colors
                        .white, // Zmieniłem kolor tekstu dla lepszej widoczności
                  ),
                  textAlign: TextAlign.center,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => pickAnswer(index),
                      child: AnswerCard(
                        currentIndex: index,
                        question: question.options[index],
                        isSelected: selectedAnswerIndex == index,
                        selectedAnswerIndex: selectedAnswerIndex,
                        correctAnswerIndex: question.correctAnswerIndex,
                      ),
                    );
                  },
                ),
                isLastQuestion
                    ? RectangularButton(
                        onPressed: () => goToNextQuestion(),
                        label: 'Zakończ',
                      )
                    : RectangularButton(
                        onPressed: selectedAnswerIndex != null
                            ? () => goToNextQuestion()
                            : null,
                        label: 'Następny',
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
