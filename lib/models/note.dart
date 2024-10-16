class Note{
  String title;
  String message;

  Note({required this.title, required this.message});

  factory Note.fromJson(Map<String,dynamic> json){
    return Note(
      title: json["title"],
      message: json["message"]
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "title" : title,
      "message" : message
    };
  }
}