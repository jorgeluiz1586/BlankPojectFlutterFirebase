import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String placeholder;
  final Function(String)? onChange;
  final Function()? onEditingComplete;
  final TextEditingController? controller;
  const InputField({
    super.key,
    required this.placeholder,
    Function(String)? this.onChange,
    Function()? this.onEditingComplete,
    TextEditingController? this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: TextField(
        controller: controller,
        onEditingComplete: onEditingComplete,
        onChanged: onChange,
        obscureText: false,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: placeholder,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
