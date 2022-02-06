class TransactionsResponse {
  int code;
  bool error;
  List<Donations> donations;
  List<Points> points;

  TransactionsResponse({this.code, this.error, this.donations, this.points});

  TransactionsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
    if (json['donations'] != null) {
      donations = new List<Donations>();
      json['donations'].forEach((v) {
        donations.add(new Donations.fromJson(v));
      });
    }
    if (json['points'] != null) {
      points = new List<Points>();
      json['points'].forEach((v) {
        points.add(new Points.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    if (this.donations != null) {
      data['donations'] = this.donations.map((v) => v.toJson()).toList();
    }
    if (this.points != null) {
      data['points'] = this.points.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Donations {
  String donationId;
  String userId;
  String ngoId;
  String campaignId;
  int amount;
  String description;
  Null proofVideoUrl;
  String createdAt;
  String updatedAt;
  Ngo ngo;

  Donations(
      {this.donationId,
      this.userId,
      this.ngoId,
      this.campaignId,
      this.amount,
      this.description,
      this.proofVideoUrl,
      this.createdAt,
      this.updatedAt,
      this.ngo});

  Donations.fromJson(Map<String, dynamic> json) {
    donationId = json['donationId'];
    userId = json['userId'];
    ngoId = json['ngoId'];
    campaignId = json['campaignId'];
    amount = json['amount'];
    description = json['description'];
    proofVideoUrl = json['proofVideoUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    ngo = json['Ngo'] != null ? new Ngo.fromJson(json['Ngo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['donationId'] = this.donationId;
    data['userId'] = this.userId;
    data['ngoId'] = this.ngoId;
    data['campaignId'] = this.campaignId;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['proofVideoUrl'] = this.proofVideoUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.ngo != null) {
      data['Ngo'] = this.ngo.toJson();
    }
    return data;
  }
}

class Ngo {
  String ngoName;

  Ngo({this.ngoName});

  Ngo.fromJson(Map<String, dynamic> json) {
    ngoName = json['ngoName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ngoName'] = this.ngoName;
    return data;
  }
}

class Points {
  String pointsId;
  String userId;
  String shopId;
  int amount;
  String createdAt;
  String updatedAt;
  Shop shop;

  Points(
      {this.pointsId,
      this.userId,
      this.shopId,
      this.amount,
      this.createdAt,
      this.updatedAt,
      this.shop});

  Points.fromJson(Map<String, dynamic> json) {
    pointsId = json['pointsId'];
    userId = json['userId'];
    shopId = json['shopId'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    shop = json['Shop'] != null ? new Shop.fromJson(json['Shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pointsId'] = this.pointsId;
    data['userId'] = this.userId;
    data['shopId'] = this.shopId;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.shop != null) {
      data['Shop'] = this.shop.toJson();
    }
    return data;
  }
}

class Shop {
  String shopName;
  String shopAddress;

  Shop({this.shopName, this.shopAddress});

  Shop.fromJson(Map<String, dynamic> json) {
    shopName = json['shopName'];
    shopAddress = json['shopAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shopName'] = this.shopName;
    data['shopAddress'] = this.shopAddress;
    return data;
  }
}
