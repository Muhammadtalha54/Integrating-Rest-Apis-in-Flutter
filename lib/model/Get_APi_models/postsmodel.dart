//if the resoponce is an array of objects which is unnamed 
//then the model created by the plugin will not be correct for implementation
// so then we will use a different method to handle that situation which is 
// implemented on the function
class Postsmodel {
  int? userId;
  int? id;
  String? title;
  String? body;

  Postsmodel({this.userId, this.id, this.title, this.body});

  Postsmodel.fromJson(Map<String, dynamic> json) {
    if(json["userId"] is int) {
      userId = json["userId"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["body"] is String) {
      body = json["body"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["id"] = id;
    _data["title"] = title;
    _data["body"] = body;
    return _data;
  }
}