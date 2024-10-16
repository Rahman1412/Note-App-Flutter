import 'package:get/get.dart';
import 'package:notes_app/views/home_page.dart';

import '../views/new_note.dart';

class AppPages{
  static const String inital_route = "/home";

  static final routes = [
    GetPage(
        name: "/home",
        page: () => HomePage()
    ),
    GetPage(
        name: "/new-note/:id",
        page: () => NotePage()
    ),
    GetPage(
        name: "/new-note",
        page: () => NotePage()
    )
  ];
}