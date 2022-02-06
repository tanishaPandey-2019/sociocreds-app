class UserResponse {
  bool error;
  int code;
  String message;
  Data data;

  UserResponse({this.error, this.code, this.message, this.data});

  UserResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userId;
  String userName;
  String email;
  String userProfileUrl;
  int credits;
  String createdAt;
  String updatedAt;

  Data(
      {this.userId,
      this.userName,
      this.email,
      this.userProfileUrl,
      this.credits,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    email = json['email'];
    userProfileUrl = json['userProfileUrl'];
    credits = json['credits'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['userProfileUrl'] = this.userProfileUrl;
    data['credits'] = this.credits;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
