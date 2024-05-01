class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? imageUrl;  // Nowe pole na URL zdjęcia

  const Question({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
    this.imageUrl,  // Zmieniony konstruktor do obsługi URL zdjęcia
  });
}