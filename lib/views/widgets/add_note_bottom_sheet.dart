import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import '/cubits/add_note_cubit/add_note_cubit.dart';
import 'add_note_form.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            // case of success...
            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.of(context).pop();
            }
            if (state is AddNoteFailure) {
              // print('failure ${state.errorMsg}');
            }
          },
          builder: (context, state) {
            // case of Loading
            // modal_progress_hud_nsn
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  // keyboardارتفاع ال
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const SingleChildScrollView(
                  child: AddNoteForm(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
