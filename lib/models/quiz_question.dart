class QuizQuestion {
  QuizQuestion({required this.question, required this.answers});

  final String question;

  final List<String> answers;

  List<String> getSuffledAnswers() {
    final ShuffledAns = List.of(answers);
    ShuffledAns.shuffle();
    return ShuffledAns;
  }
}
