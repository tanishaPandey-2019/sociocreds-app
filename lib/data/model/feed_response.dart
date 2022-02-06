class FeedResponse {
  bool error;
  int code;
  List<Data> data;
  String message;

  FeedResponse({this.error, this.code, this.data, this.message});

  FeedResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String postId;
  String postTitle;
  String postDescription;
  String postPhotoUrl;
  String ngoId;
  String createdAt;
  String updatedAt;

  Data(
      {this.postId,
      this.postTitle,
      this.postDescription,
      this.postPhotoUrl,
      this.ngoId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    postTitle = json['postTitle'];
    postDescription = json['postDescription'];
    postPhotoUrl = json['postPhotoUrl'];
    ngoId = json['ngoId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['postTitle'] = this.postTitle;
    data['postDescription'] = this.postDescription;
    data['postPhotoUrl'] = this.postPhotoUrl;
    data['ngoId'] = this.ngoId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
