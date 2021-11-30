class QuizModel {
  QuizModel(
      {required this.id,
      required this.question,
      required this.category,
      required this.correctAnswer,
      required this.incorrectAnswers});

  final int id;
  final String question;
  final String category;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'],
      question: map['question'],
      category: map['category'],
      correctAnswer: map['correct_answer'],
      incorrectAnswers: map['incorrect_answers'],
    );
  }
}
