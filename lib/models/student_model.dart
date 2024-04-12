// ignore_for_file: non_constant_identifier_names

class StudentModel {
  late final String std_name;
  late final String admission_num;
  late final String image;

  StudentModel( {
    required this.std_name,
    required this.admission_num,
    required this.image,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      std_name: json["std_name"]??'', 
      admission_num: json["admission_num"]??'',
      image: json["image"]??'',
    );
  }
}