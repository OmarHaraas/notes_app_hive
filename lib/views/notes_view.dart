import 'package:flutter/material.dart';
import './widgets/notes_view_body.dart';
import 'widgets/add_note_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true, //for keyboard
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            sheetAnimationStyle: AnimationStyle(
              duration: const Duration(seconds: 1),
              reverseDuration: const Duration(seconds: 1),
            ),
            context: context,
            builder: (context) {
              return const MyBottomSheet();
            },
          );
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
