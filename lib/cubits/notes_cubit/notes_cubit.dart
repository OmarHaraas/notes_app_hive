import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '/models/notes_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  //make a ist
  List<NotesModel>? notes;

  //method to fetch
  fetchAllNotes() {
    var notesBox = Hive.box<NotesModel>(kNotesBox);
    notes = notesBox.values.toList();
    // emit(NotesSuccess(notes!));
    emit(NotesSuccess());
  }
}
