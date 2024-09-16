// lib/screens/notes_screen.dart

import 'package:calcy_app/Models/note_model.dart';
import 'package:calcy_app/screens/Notes/database_helper.dart';
import 'package:flutter/material.dart';


class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  _refreshNotes() async {
    List<Note> notes = await _dbHelper.getNotes();
    setState(() {
      _notes = notes;
    });
  }

  _showNoteDialog({Note? note}) {
    final TextEditingController titleController = TextEditingController(
      text: note?.title ?? '',
    );
    final TextEditingController contentController = TextEditingController(
      text: note?.content ?? '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(note == null ? 'New Note' : 'Edit Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: 'Content'),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                if (titleController.text.isNotEmpty) {
                  if (note == null) {
                    await _dbHelper.insertNote(Note(
                      title: titleController.text,
                      content: contentController.text,
                      date: DateTime.now().toString(),
                    ));
                  } else {
                    await _dbHelper.updateNote(Note(
                      id: note.id,
                      title: titleController.text,
                      content: contentController.text,
                      date: DateTime.now().toString(),
                    ));
                  }
                  _refreshNotes();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  _deleteNoteDialog(Note note) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Note'),
          content: const Text('Are you sure you want to delete this note?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await _dbHelper.deleteNote(note.id!);
                _refreshNotes();
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            Note note = _notes[index];
            return Card(
              child: ListTile(
                title: Text(note.title),
                subtitle: Text(note.date),
                onTap: () => _showNoteDialog(note: note),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteNoteDialog(note),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNoteDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
