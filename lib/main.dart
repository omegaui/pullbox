import 'package:flutter/material.dart';
import 'package:pullbox/add_link_box.dart';
import 'package:pullbox/app_data_manager.dart';
import 'package:pullbox/main_panel.dart';
import 'package:pullbox/resource_provider.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<MainPanelState> mainPanelKey = GlobalKey();

void main() {
  runApp(const App());
}

class App extends StatelessWidget{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PullBox",
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          tooltip: "View project on GitHub",
                          onPressed: () async {
                            dynamic url = Uri.parse('https://github.com/omegaui/pullbox');
                            if(await canLaunchUrl(url)){
                              await launchUrl(url);
                            }
                          },
                          icon: const Image(image: githubIcon),
                          iconSize: 48,
                          splashRadius: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      const Image(
                        image: appIcon128,
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
          Expanded(child: MainPanel(key: mainPanelKey)),
        ],
      ),
    );
  }
}
