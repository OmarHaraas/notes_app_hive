import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/notes_model.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});
  final NotesModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView(note: note);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.white, fontSize: 26),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(.6),
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(Icons.delete_rounded),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                // '${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}   ',
                note.date,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
