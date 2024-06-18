import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import '/models/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  // bool isLoading = false;
  // add note
  addNote(NotesModel model) async {
    // isLoading = true; //-------------->loading
    emit(AddNoteLoading());
    try {
      // final notesBox = Hive.box<NotesModel>(kNotesBox);
      var notesBox = Hive.box<NotesModel>(kNotesBox);
      // isLoading = false; //-------------->stop loading
      await notesBox.add(model);
      emit(AddNoteSuccess());
    } catch (e) {
      // isLoading = false; //-------------->stop loading
      emit(AddNoteFailure(e.toString()));
    }
  }
}
