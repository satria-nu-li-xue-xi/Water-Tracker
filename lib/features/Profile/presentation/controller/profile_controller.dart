import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isEditing = false;

  void editingData() {
    isEditing = true;
    update();
  }

  void fixData() {
    isEditing = false;
    update();
  }
}
