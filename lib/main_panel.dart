import 'package:flutter/material.dart';
import 'package:pullbox/link_container.dart';
import 'package:pullbox/link_data.dart';
import 'package:pullbox/search_field.dart';

List<LinkData> links = [
  LinkData('app', 'url', 'IntelliJ version 2023'),
  LinkData('package', 'url', 'gnome-system-monitor'),
  LinkData('archive', 'url', 'android-x86_64-rom'),
  LinkData('image', 'url', 'omegaide light mode'),
  LinkData('text-file', 'url', 'windows activation cheat code'),
];

class MainPanel extends StatelessWidget {
  const MainPanel({Key? key}) : super(key: key);

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
