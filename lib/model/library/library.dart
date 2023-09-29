class AddLibModel {
  String? name;
  String? image;
  String? gitHubUrl;
  String? pubDevUrl;
  String? collectionName;
  AddLibModel.fromJosn(Map<String, dynamic> json) {
    name = json["name"];
    image = json["image"];
    gitHubUrl = json["gitHubUrl"];
    pubDevUrl = json["pubDevUrl"];
    collectionName = json["collectionName"];
  }
}
