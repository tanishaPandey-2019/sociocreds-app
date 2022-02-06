class LeaderboardResponse {
  int code;
  String message;
  bool error;
  List<RecentDonations> recentDonations;
  List<MostDonations> mostDonations;

  LeaderboardResponse(
      {this.code,
      this.message,
      this.error,
      this.recentDonations,
      this.mostDonations});

  LeaderboardResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    error = json['error'];
    if (json['recentDonations'] != null) {
      recentDonations = new List<RecentDonations>();
      json['recentDonations'].forEach((v) {
        recentDonations.add(new RecentDonations.fromJson(v));
      });
    }
    if (json['mostDonations'] != null) {
      mostDonations = new List<MostDonations>();
      json['mostDonations'].forEach((v) {
        mostDonations.add(new MostDonations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.recentDonations != null) {
      data['recentDonations'] =
          this.recentDonations.map((v) => v.toJson()).toList();
    }
    if (this.mostDonations != null) {
      data['mostDonations'] =
          this.mostDonations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentDonations {
  int amount;
  String createdAt;
  User user;

  RecentDonations({this.amount, this.createdAt, this.user});

  RecentDonations.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    createdAt = json['createdAt'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    if (this.user != null) {
      data['User'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String userName;

  User({this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    return data;
  }
}

class MostDonations {
  int amount;
  User user;

  MostDonations({this.amount, this.user});

  MostDonations.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    if (this.user != null) {
      data['User'] = this.user.toJson();
    }
    return data;
  }
}
