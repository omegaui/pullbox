import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pullbox/app_data_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import 'link_data.dart';

class LinkContainer extends StatelessWidget {
  final LinkData linkData;

  const LinkContainer({Key? key, required this.linkData}) : super(key: key);

  IconData getIcon() {
    if (linkData.type == 'app') {
      return Icons.touch_app;
    } else if (linkData.type == 'package') {
      return Icons.card_travel;
    } else if (linkData.type == 'archive') {
      return Icons.archive;
    } else if (linkData.type == 'image') {
      return Icons.image_rounded;
    }
    return Icons.text_rotation_angleup;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey.shade900.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(
              getIcon(),
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              linkData.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Tooltip(
                    message: "Open in browser",
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.cyanAccent),
                      onPressed: () async {
                        dynamic url = Uri.parse(linkData.url);
                        if(await canLaunchUrl(url)){
                          await launchUrl(url);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.open_in_browser,
                          color: Colors.cyan,
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "Copy Download link",
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: linkData.url));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.copy,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: "Delete this link",
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        removeLink(linkData);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.playlist_remove_outlined,
                          color: Colors.red.shade200,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
