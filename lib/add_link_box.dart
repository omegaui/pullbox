
import 'package:flutter/material.dart';
import 'package:pullbox/app_data_manager.dart';
import 'package:pullbox/link_data.dart';

final TextEditingController nameFieldController = TextEditingController();
final TextEditingController urlFieldController = TextEditingController();
final GlobalKey<TitleWidgetState> titleWidgetKey = GlobalKey();
final GlobalKey<LinkIconSelectorState> linkIconSelectorKey = GlobalKey();

void showAddLinkBox(BuildContext context){
  showDialog(
    context: context,
    builder: (context) {
      return SizedBox(
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  TitleWidget(key: titleWidgetKey),
                  const SizedBox(height: 10),
                  LinkIconSelector(key: linkIconSelectorKey),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      controller: nameFieldController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Link Display Name",
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
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      controller: urlFieldController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "URL",
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
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      String name = nameFieldController.text;
                      if(name.isEmpty){
                        titleWidgetKey.currentState?.setTitle("Name cannot be empty");
                        return;
                      }
                      String url = urlFieldController.text;
                      if(url.isEmpty){
                        titleWidgetKey.currentState?.setTitle("URL cannot be empty");
                        return;
                      }
                      putLink(LinkData(linkIconSelectorKey.currentState?.category as String, url, name));
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Add Link",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class TitleWidget extends StatefulWidget{
  const TitleWidget({Key? key}) : super(key: key);

  @override
  State<TitleWidget> createState() => TitleWidgetState();
}

class TitleWidgetState extends State<TitleWidget> {

  String title = "Add new Link";

  void setTitle(String text){
    setState(() {
      title = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class LinkIconSelector extends StatefulWidget{
  const LinkIconSelector({Key? key}) : super(key: key);

  @override
  State<LinkIconSelector> createState() => LinkIconSelectorState();
}

class LinkIconSelectorState extends State<LinkIconSelector> {

  String category = 'app';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.grey.shade900,
          child: IconButton(
            onPressed: () {
              setState(() {
                category = 'app';
              });
            },
            icon: Icon(
              Icons.touch_app,
              color: category == 'app' ? Colors.blue : Colors.grey.shade100,
            ),
          ),
        ),
        Material(
          color: Colors.grey.shade900,
          child: IconButton(
            onPressed: () {
              setState(() {
                category = 'package';
              });
            },
            icon: Icon(
              Icons.card_travel,
              color: category == 'package' ? Colors.blue : Colors.grey.shade100,
            ),
          ),
        ),
        Material(
          color: Colors.grey.shade900,
          child: IconButton(
            onPressed: () {
              setState(() {
                category = 'archive';
              });
            },
            icon: Icon(
              Icons.archive,
              color: category == 'archive' ? Colors.blue : Colors.grey.shade100,
            ),
          ),
        ),
        Material(
          color: Colors.grey.shade900,
          child: IconButton(
            onPressed: () {
              setState(() {
                category = 'image';
              });
            },
            icon: Icon(
              Icons.image_rounded,
              color: category == 'image' ? Colors.blue : Colors.grey.shade100,
            ),
          ),
        ),
        Material(
          color: Colors.grey.shade900,
          child: IconButton(
            onPressed: () {
              setState(() {
                category = 'text-file';
              });
            },
            icon: Icon(
              Icons.text_rotation_angleup,
              color: category == 'text-file' ? Colors.blue : Colors.grey.shade100,
            ),
          ),
        ),
      ],
    );
  }
}




