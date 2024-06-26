import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planetquiz/models/questions.dart';
import 'package:planetquiz/screens/RoleSpecificQuizScreen.dart';
import 'package:planetquiz/styles.dart';
import 'package:planetquiz/widgets/answer_card.dart';
import 'package:planetquiz/widgets/help_widget.dart';
import 'package:planetquiz/widgets/next_button.dart';
import 'package:audioplayers/audioplayers.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.userName,
    required this.userSurname,
    required this.userRole,
    required this.userRoleIcon,
    this.backgroundImage = 'assets/animations/QuizScreenBackground.gif',
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
    randomQuestionIndices = List.generate(
        questions.length > 10 ? 10 : questions.length, (index) => index)
      ..shuffle();
  }

  void playSound(String path) async {
    await _audioPlayer.play(AssetSource(path));
  }

  void pickAnswer(int value) {
    if (selectedAnswerIndex != null) return;

    setState(() {
      selectedAnswerIndex = value;
    });

    final question = questions[randomQuestionIndices[questionIndex]];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
      playSound('assets/sounds/correct_answer.mp3');
    } else {
      playSound('assets/sounds/wrong_answer.mp3');
    }
  }

  void showCompletionDialog() {
  int countdown = 10;
  
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: '',
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, anim1, anim2) {
      return StatefulBuilder(
        builder: (context, setState) {
          Future.delayed(Duration(seconds: 1), () {
            if (countdown > 0) {
              setState(() {
                countdown--;
              });
            } else {
              Navigator.of(context).pop(); // Dismiss the dialog
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => RoleSpecificQuizScreen(
                    score: score,
                    userRole: widget.userRole,
                    userRoleIcon: widget.userRoleIcon,
                  ),
                ),
              );
            }
          });

          return AlertDialog(
  backgroundColor: Color.fromARGB(206, 27, 0, 53),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
    side: BorderSide(color: orange, width: 4),
  ),
  title: Text(
    'Pierwsza część za tobą!\n Teraz pora na pytania roli która wybrałeś',
    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
    textAlign: TextAlign.center,
  ),
  content: Text(
    'Twój aktualny wynik to: $score.\n\n\n\nPrzejdziemy dalej za $countdown sekund...',
    style: TextStyle(fontSize: 22, color: Colors.white),
    textAlign: TextAlign.center,
  ),
  contentPadding: EdgeInsets.all(16.0),
);


        },
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOutBack,
          ),
        ),
        child: child,
      );
    },
  );
}


  void goToNextQuestion() {
    if (questionIndex < randomQuestionIndices.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      playSound('assets/sounds/quiz_end.mp3');
      showCompletionDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[randomQuestionIndices[questionIndex]];
    bool isLastQuestion = questionIndex == randomQuestionIndices.length - 1;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
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
              widget.backgroundImage,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 30,
              top: 30,
              child: IconButton(
                icon: Icon(Icons.help_outline, color: Colors.white),
                iconSize: 50,
                onPressed: () => showHelpOverlay(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(0, 0, 0, 0).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      question.question,
                      style: TextStyle(fontSize: 34, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  if (question.imageUrl != null) // Conditional image display
                    Container(
                      width: 300,
                      height: 200,
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
                          label: 'Następne',
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
