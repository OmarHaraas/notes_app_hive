import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cubits/add_note_cubit/add_note_cubit.dart';
import '/models/notes_model.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> myFormGlobalKey = GlobalKey();

  //auto validate object
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // two variables to get input from user
  String? title, subTitle;
  // initializing non-const/final variables should be in stfl

  @override
  Widget build(BuildContext context) {
    return Form(
      key: myFormGlobalKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          MyCustomTextField(
            hint: 'Title',
            onSaved: (value) => title = value,
          ),
          const SizedBox(height: 20),
          MyCustomTextField(
            hint: 'Content Of Note',
            maxLines: 5,
            onSaved: (value) => subTitle = value,
          ),
          const SizedBox(height: 20),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  //\validation process..........
                  if (myFormGlobalKey.currentState!.validate()) {
                    myFormGlobalKey.currentState!.save(); //save

                    // after saving
                    var noteModel = NotesModel(
                      title: title!,
                      subtitle: subTitle!,
                      ////////////////
                      date:
                          '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}   ',
                      color: Colors.blue[800]!.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
