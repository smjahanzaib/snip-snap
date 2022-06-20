class Faqs {
  int faq_id;

  String question;
  String answer;

  Faqs();

  Faqs.fromJson(Map<String, dynamic> json) {
    try {
      faq_id = int.parse((json['faq_id'] ?? 0).toString());

      question = (json['question'] ?? '').toString();
      answer = (json['answer'] ?? '').toString();
    } catch (e) {
      print("Exception - faqsModel.dart - Faqs.fromJson():" + e.toString());
    }
  }
}
