import 'package:flutter/material.dart';
import 'package:todo_app/utils/strings.dart';

class repTextField extends StatelessWidget {
  const repTextField({
    super.key,
    required this.controller,
    this.isForDescription = false,
  });

  final TextEditingController controller;
  final bool isForDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: TextFormField(
          controller: controller,
          maxLines: !isForDescription ? 6 : null,
          cursorHeight: isForDescription ? 22 : null,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: isForDescription ? InputBorder.none : null,
            hintText: isForDescription ? MyString.addNote : null,
            prefixIcon: isForDescription
                ? const Icon(
                    Icons.bookmark_border,
                    color: Colors.grey,
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          onFieldSubmitted: (value) {},
          onChanged: (value) {},
        ),
      ),
    );
  }
}