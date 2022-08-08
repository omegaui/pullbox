import 'package:flutter/material.dart';
import 'package:pullbox/link_container.dart';
import 'package:pullbox/search_field.dart';

import 'app_data_manager.dart';

class MainPanel extends StatefulWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  State<MainPanel> createState() => MainPanelState();
}

class MainPanelState extends State<MainPanel> {
  
  void rebuild(){
    setState(() {
      // rebuilding widget ...
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          width: 470,
          child: SearchField(),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height - 220,
            decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: links.map((e) => LinkContainer(linkData: e)).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
