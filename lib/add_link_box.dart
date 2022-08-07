
import 'package:flutter/material.dart';

void showAddLinkBox(BuildContext context){
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        child: Center(
          child: Container(
            width: 500,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    },
  );
}




