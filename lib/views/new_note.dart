import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notes_app/controllers/note_controller.dart';
import 'components/HeightSpacer.dart';

class NotePage extends StatelessWidget {
  final String? id = Get.parameters["id"];
  final NoteController nc = Get.find();
  @override
  Widget build(BuildContext context) {
    if(id != null){
      nc.getNote(id);
    }else{
      nc.clearField();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(id != null ? "Update Note" : "New Note"),
        centerTitle: true
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: nc.noteForm,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nc.title,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Title",
                      labelText: "Title"
                    ),
                    validator: nc.validateTitle,
                    autovalidateMode: AutovalidateMode.onUnfocus,
                  ),
                  HeightSpacer(height:20),
                  TextFormField(
                    controller: nc.message,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Message",
                        labelText: "Message",
                        alignLabelWithHint: true
                    ),
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    validator: nc.validateMessage,
                    autovalidateMode: AutovalidateMode.onUnfocus,
                  ),
                  HeightSpacer(height:20),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          if(id != null) nc.updateNote(id); else nc.addNote();
                        },
                        child: Text("Save")
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    ),);
  }
}