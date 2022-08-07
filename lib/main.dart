import 'package:flutter/material.dart';
import 'package:pullbox/add_link_box.dart';
import 'package:pullbox/app_data_manager.dart';
import 'package:pullbox/main_panel.dart';
import 'package:pullbox/resource_provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const ContentPane(),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor: Colors.grey.shade800,
              onPressed: () {
                showAddLinkBox(context);
              },
              child: const Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              // child: ,
            );
          }
        ),
      ),
    );
  }

}

class ContentPane extends StatefulWidget{
  const ContentPane({Key? key}) : super(key: key);

  @override
  State<ContentPane> createState() => _ContentPaneState();
}

class _ContentPaneState extends State<ContentPane> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      initAppStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey.shade900,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width/3,
            color: Colors.grey.shade800.withOpacity(0.2),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Image(
                        image: appIcon(128),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "PullBox",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Swiss Link Manager",
                        style: TextStyle(
                          color: Colors.blueGrey.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: MainPanel()),
        ],
      ),
    );
  }
}
