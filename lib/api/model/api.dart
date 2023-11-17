import 'package:mongo_dart/mongo_dart.dart';

class Api {
  ObjectId? id;
  String? path;

  Api({this.id, this.path});

  Api.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['path'] = path;
    return data;
  }
}
