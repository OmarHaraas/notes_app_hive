import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'custom_app_bar.dart';
import 'custom_textfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NotesModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  // we will create two variables
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomAppBar(
            onPressed: () {
              //
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = subtitle ?? widget.note.subtitle;

              //to save changes in hive
              widget.note.save();

              //refresh notes
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              //remve the edit view
              Navigator.pop(context);
            },
            title: 'Edit',
            icon: Icons.done_rounded,
          ),
          const SizedBox(height: 22),
          MyCustomTextField(
            hint: widget.note.title,
            onChanged: (val) {
              title = val;
            },
          ),
          const SizedBox(height: 22),
          MyCustomTextField(
            hint: widget.note.subtitle,
            maxLines: 5,
            onChanged: (p0) {
              subtitle = p0;
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
