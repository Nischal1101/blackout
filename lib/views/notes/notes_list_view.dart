import 'package:blackout/services/crud/note_service.dart';
import 'package:blackout/utilities/dialogs/delete_dialog.dart';
import 'package:flutter/material.dart';


typedef DeleteNoteCallBack = void Function(DataNotes note);

class NotesListView extends StatelessWidget {
  final List<DataNotes> notes;
  final DeleteNoteCallBack onDeleteNote;
  const NotesListView(
      {Key? key, required this.notes, required this.onDeleteNote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                onDeleteNote(note);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}