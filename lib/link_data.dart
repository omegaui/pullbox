class LinkData {
  final String type;
  final String url;
  final String name;

  LinkData(this.type, this.url, this.name);

  @override
  String toString() {
    return "{\"type\": \"$type\", \"url\": \"$url\", \"name\": \"$name\"}";
  }
}
