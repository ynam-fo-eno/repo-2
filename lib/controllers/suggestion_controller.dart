import 'package:get/get.dart';

class SuggestionController extends GetxController {
  var suggestionList = [].obs;

  updateSuggestionList(desires) {
    suggestionList.value = desires;
  }
}
