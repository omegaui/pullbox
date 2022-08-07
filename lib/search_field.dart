import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool focussed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: focussed
              ? Colors.grey.shade900
              : Colors.grey.shade800.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (focussed)
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 2,
              ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.link_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 366,
                child: Focus(
                  onFocusChange: (value) {
                    setState(() {
                      focussed = value;
                    });
                  },
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: "Search Links",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
