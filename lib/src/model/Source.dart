class Source {
  late final String? id;
  late final String? name;

  Source({required this.id, required this.name});

  Source.fromJson(Map<String, dynamic> json){
      id = json['id'] ?? "";
      name = json['name'] ?? "";
  }

  Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;
      data['name'] = name;
      return data;
  }
}