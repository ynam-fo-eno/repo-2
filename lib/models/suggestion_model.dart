// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class SuggestionModel {
  var id;
  var full_name;
  var email;
  var suggestion;

  SuggestionModel({
    required this.id,
    required this.full_name,
    required this.email,
    required this.suggestion,
  });

  factory SuggestionModel.fromJson(Map<String, dynamic> json) {
    return SuggestionModel(
     id: json["id"] ?? '',
     full_name: json["full_name"] ?? '',
     email: json["email"] ?? '',
     suggestion: json["suggestion"] ?? '',
    );
  }
}
