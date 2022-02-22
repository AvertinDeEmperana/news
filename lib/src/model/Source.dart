class Source {

    int iD = 0;
    late final String id;
    late final String name;

    Source({required this.id, required this.name});
    Source.fromEntity({required this.iD, required this.id, required this.name});

    Source.fromJson(Map<String, dynamic> json){
        id = json['id'] ?? "";
        name = json['name'] ?? "";
    }
}