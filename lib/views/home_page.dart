import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/note_controller.dart';

class HomePage extends StatelessWidget{
  final NoteController nc = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed("/new-note");
          },
        child: Icon(Icons.add),
      ),
      body: Obx(() {
        
        if(nc.notes.isEmpty){
          return Center(
            child: Text("Empty Notes",
                style: TextStyle(color: Colors.red)
            ),
          );
        }

        return ListView.builder(
          itemCount: nc.notes.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(nc.notes[index].title),
                            Text(
                                nc.notes[index].message,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
                            )
                          ],
                        )
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed("/new-note/${index}");
                        },
                        icon: Icon(Icons.edit)
                    ),
                    IconButton(
                        onPressed: () {
                          nc.deleteNote(index);
                        },
                        icon: Icon(Icons.delete)
                    )
                  ],
                ),
              ),
            );
          },
        );
      })
    );
  }
}