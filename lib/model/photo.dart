
class Photo {
  int? id;
  String? name;
  Photo({
    required this.id,
    required this.name,
  });
  

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      name: json['name'],
    );
  }
}
