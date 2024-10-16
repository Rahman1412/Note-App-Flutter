import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/models/note.dart';

class NoteController extends GetxController{
  final GlobalKey<FormState> noteForm = GlobalKey<FormState>();
  late TextEditingController title,message;
  late Box noteBox;

  var notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    title = TextEditingController();
    message = TextEditingController();
    noteBox = Hive.box("noteBox");
    getNotes();
  }

  String? validateTitle(String? value){
    if(value!.isEmpty){
      return "Title is required";
    }
    return null;
  }

  void getNote(String? id){
    final index = int.parse(id!);
    var note = notes[index];
    title.text = note.title;
    message.text = note.message;
  }

  void getNotes(){
    var noteList = noteBox.values.map((data) => Note.fromJson(Map<String, dynamic>.from(data))).toList();
    notes.value = noteList;
  }

  String? validateMessage(String? value){
    if(value!.isEmpty){
      return "Message is required";
    }
    return null;
  }

  void clearField(){
    title.text = "";
    message.text = "";
  }

  void updateNote(String? id){
    var index = int.parse(id!);
    var note = Note(title: title.text, message: message.text);
    noteBox.put(index,note.toJson());
    getNotes();
    Get.back();
  }

  void deleteNote(int id) async{
    await noteBox.deleteAt(id);
    notes.removeAt(id);
    showSnackBar("Deleted!","Note deleted successfully!");
  }

  void showSnackBar(String title,String msg) {
    Get.showSnackbar(
        GetSnackBar(
          title: title,
          message: msg,
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        )
    );
  }

  void addNote(){
    if(!noteForm.currentState!.validate()){
      return;
    }
    var note = Note(title: title.text, message: message.text);
    noteBox.add(note.toJson());
    getNotes();
    Get.back();
  }

  @override
  void onClose() {
    super.onClose();
    title.dispose();
    message.dispose();
  }
}