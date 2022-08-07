import 'dart:io';

import 'package:dynojsonstore/dynojsonstore.dart';

DynoJsonStore appSettings = DynoJsonStore(storePath: ".pullbox/app-store.json");

void initAppStore() async {
  final request = await HttpClient().getUrl(Uri.parse('https://img.icons8.com/external-wanicon-lineal-color-wanicon/100/000000/external-download-user-interface-wanicon-lineal-color-wanicon.png'));
  final response = await request.close();
  response.pipe(File('foo.txt').openWrite());
}
