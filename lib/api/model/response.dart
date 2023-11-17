class Response {
  int? code;
  bool? success;
  String? message;
  Map<String, dynamic>? data;

  Response({code, success, message, data});

  Response.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['success'] = success;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
