import 'package:get/get.dart';

class StudentController extends GetxController { 
  final studentList=[].obs;
  final isLoadingStudentData= true.obs;

  updateStudentList(list) {
    studentList.value=list;
  }

   updateLoadingList(inaload) {
    isLoadingStudentData.value = inaload;
  }
}