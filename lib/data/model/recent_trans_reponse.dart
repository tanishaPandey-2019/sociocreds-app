class RecentTransResponse {
  int code;
  bool error;
  List<Data> data;

  RecentTransResponse({this.code, this.error, this.data});

  RecentTransResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String name;
  String desc;
  int amount;
  bool positive;
  String ts;

  Data({this.name, this.desc, this.amount, this.positive, this.ts});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    amount = json['amount'];
    positive = json['positive'];
    ts = json['ts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['amount'] = this.amount;
    data['positive'] = this.positive;
    data['ts'] = this.ts;
    return data;
  }
}
