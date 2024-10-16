import 'package:get/get.dart';
import 'package:notes_app/controllers/home_controller.dart';
import 'package:notes_app/controllers/note_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NoteController());
    Get.put(HomeController());
  }
}