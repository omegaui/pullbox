import 'dart:convert';

import 'package:dynojsonstore/dynojsonstore.dart';
import 'package:pullbox/main.dart';

import 'link_data.dart';

DynoJsonStore appSettings = DynoJsonStore(storePath: ".pullbox/app-store.json");

List<LinkData> links = [];
List<LinkData> originalList = [];

void initAppStore() async {
  dynamic linkList = jsonDecode(appSettings.get('links'));
  if(linkList != null){
    for(var link in linkList){
      links.add(LinkData(link['type'], link['url'], link['name']));
    }
  }
  originalList.addAll(links);
  mainPanelKey.currentState?.rebuild();
}

void search(String text){
  links.clear();
  for(var link in originalList){
    if(link.name.contains(text) || link.url.contains(text)){
      links.add(link);
    }
  }
  mainPanelKey.currentState?.rebuild();
}

void putLink(LinkData linkData){
  links.add(linkData);
  originalList.add(linkData);
  appSettings.put('links', originalList.toString());
  mainPanelKey.currentState?.rebuild();
}

void removeLink(LinkData linkData){
  links.remove(linkData);
  originalList.remove(linkData);
  appSettings.put('links', originalList.toString());
  mainPanelKey.currentState?.rebuild();
}
