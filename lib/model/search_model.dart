import 'dart:convert';




class SearchTitles {
  bool? _status;
  String? _statusNumber;
  String? _message;
  List<TitleItem>? _items;
  List<TitleItem> get items => _items!;
  ProductsModel({
    required status,
    required statusNumber,
    required message,
    required items,
  }) {
    this._status = status;
    this._statusNumber = statusNumber;
    this._message = message;
    this._items = items;
  }

//

  SearchTitles.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _statusNumber = json['statusNumber'];
    _message = json['message'];
    if (json['items'] != null) {
      print("object ${json['items']}");
      _items = <TitleItem>[];
      json['items'].forEach((v) {
        _items?.add(TitleItem.fromJson(v));
      });
    }
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
class TitleItem {
  String? name;
  TitleItem({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': name,
    };
  }

  factory TitleItem.fromJson(Map<String, dynamic> json) {
    return TitleItem(
      name: json['name'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory SearchTitles.fromJson(String source) => SearchTitles.fromMap(json.decode(source) as Map<String, dynamic>);
}
