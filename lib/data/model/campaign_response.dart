class CampaignResponse {
  int code;
  List<Data> data;

  CampaignResponse({this.code, this.data});

  CampaignResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
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
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String ngoName;
  String tagline;
  String title;
  int moneyRequired;
  int raisedAmount;

  Data(
      {this.ngoName,
      this.tagline,
      this.title,
      this.moneyRequired,
      this.raisedAmount});

  Data.fromJson(Map<String, dynamic> json) {
    ngoName = json['ngoName'];
    tagline = json['tagline'];
    title = json['title'];
    moneyRequired = json['moneyRequired'];
    raisedAmount = json['raisedAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ngoName'] = this.ngoName;
    data['tagline'] = this.tagline;
    data['title'] = this.title;
    data['moneyRequired'] = this.moneyRequired;
    data['raisedAmount'] = this.raisedAmount;
    return data;
  }
}
