import 'package:flutter/material.dart';
import 'package:planetquiz/models/question.dart';
import 'package:planetquiz/models/questions.dart';
import 'package:planetquiz/screens/result_screen.dart';
import 'package:planetquiz/widgets/answer_card.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:planetquiz/widgets/loading_screen.dart';
import 'package:planetquiz/widgets/next_button.dart';

class RoleSpecificQuizScreen extends StatefulWidget {
  const RoleSpecificQuizScreen({
    super.key,
    required this.score,
    required this.userRole,
    required this.userRoleIcon,
  });
  final int score;
  final String userRole;
  final IconData userRoleIcon;
  @override
  _RoleSpecificQuizScreenState createState() => _RoleSpecificQuizScreenState();
}

class _RoleSpecificQuizScreenState extends State<RoleSpecificQuizScreen> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  int score = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    score = widget.score;  // Initialize score with the passed initial score
    questions = roleQuestions[widget.userRole] ?? [];
    questions.shuffle();
  }

  void playSound(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  void pickAnswer(int index) {
    if (selectedAnswerIndex == null) { // Only allow answer selection if none has been selected yet
      setState(() {
        selectedAnswerIndex = index;
      });
    }
  }

  void confirmAnswer() {
    if (!mounted) return; // Check again if the widget is still mounted

    // Check if the selected answer is correct
    if (selectedAnswerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      score++; // Increment the score for correct answers
      playSound('assets/sounds/correct_answer.mp3');
    } else {
      playSound('assets/sounds/wrong_answer.mp3');
    }

    // Navigate to the next question or complete the quiz
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null; // Reset the answer for the next question
      });
    } else {
      playSound('assets/sounds/quiz_end.mp3');
      
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LoadingScreen(),
        ),
      );

      // Simuluj czas ładowania przed przejściem do ekranu wyników
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => ResultScreen(
                score: score,
                userRole: widget.userRole,
                userRoleIcon: widget.userRoleIcon,
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Question question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text('Specjalnie pytania dla:    '),
            Icon(widget.userRoleIcon),
            SizedBox(width: 10),
            Text(widget.userRole),
            Spacer(),
            Image.asset(
              'assets/AlverniaLogo.png',
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/Tla/Dogrywka.gif',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(
                    question.question,
                    style: TextStyle(fontSize: 34, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (question.imageUrl != null) // Conditional image display
                  Container(
                    width: 300, // Defined width
                    height: 200, // Defined height
                    child: Image.asset(
                      question.imageUrl!,
                      fit: BoxFit.contain, // Keep proportions without cropping
                    ),
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
                        backgroundColor: selectedAnswerIndex != null ? (selectedAnswerIndex == index ? Color.fromARGB(255, 161, 3, 3) : Color.fromARGB(255, 61, 34, 34)) : const Color.fromARGB(255, 75, 28, 28),
                        selectedBackgroundColor: Color.fromARGB(255, 233, 62, 62),
                        correctBorderColor: Colors.green,
                        wrongBorderColor: Colors.red,
                        defaultBorderColor: Colors.white24,
                      ),
                    );
                  },
                ),
                RectangularButton(
                  onPressed: selectedAnswerIndex != null ? confirmAnswer : null,
                  label: currentQuestionIndex < questions.length - 1 ? 'Następny' : 'Zakończ',
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
