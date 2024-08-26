// lib/note_model.dart

class Note {
  int? id;
  String title;
  String content;
  String date;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.date,
  });

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'date': date,
    };
  }

  // Extract a Note object from a Map object
  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      date: map['date'],
    );
  }
}
