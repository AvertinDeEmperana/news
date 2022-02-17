class Source {
  late final String? id;
  late final String name;

  Source({this.id, required this.name});

  Source.fromJson(Map<String, dynamic> json){
    id = null;
    name = json['name'];
  }
}