import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  const MyCustomTextField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});
  final String hint;
  final int maxLines;

  final void Function(String?)? onSaved;
  final  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required';
          //I have repeated the video many times because
          /// I wrote ['Field is required';]
          /// insterd [return'Field is required';]
          /// Do not forget retrun keyword again!!!!!
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 18),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
