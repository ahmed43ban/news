import 'Source.dart';

/// status : "ok"
/// code : "apiKeyMissing"
/// message : "Your API key is missing. Append this to the URL with the apiKey param, or use the x-api-key HTTP header."
/// sources : [{"id":"argaam","name":"Argaam","description":"ارقام موقع متخصص في متابعة سوق الأسهم السعودي تداول - تاسي - مع تغطيه معمقة لشركات واسعار ومنتجات البتروكيماويات , تقارير مالية الاكتتابات الجديده ","url":"https://www.argaam.com","category":"business","language":"ar","country":"sa"}]

class SourcesResponse {
  SourcesResponse({
      this.status, 
      this.code, 
      this.message, 
      this.sources,});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}