import 'dart:async';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String query) onChanged;

  const CustomSearchBar(
      {Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<CustomSearchBar> {
  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[900],
          labelStyle: const TextStyle(color: Colors.white),
          hintText: 'Enter movie name...',
          hintStyle: TextStyle(color: Colors.grey[500]),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (query) {
          if (debounce?.isActive ?? false) debounce!.cancel();
          debounce = Timer(const Duration(milliseconds: 500), () {
            if (query.length >= 3) {
              widget.onChanged(query); // Call the passed function
            }
          });
        },
      ),
    );
  }
}
