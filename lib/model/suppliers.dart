class Supplier{
  int? id;
  String? name;
  Supplier({
    this.id,
    this.name,
  });
  

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json['id'],
      name: json['name'],
    );
  }
}