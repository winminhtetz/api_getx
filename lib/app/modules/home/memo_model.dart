class Memo {
  List<Data>? data;
  int? page;
  int? count;
  int? perPage;

  Memo({this.data, this.page, this.count, this.perPage});

  Memo.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    page = json['page'];
    count = json['count'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['page'] = page;
    data['count'] = count;
    data['perPage'] = perPage;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? date;
  String? content;
  int? createdAt;
  int? updatedAt;

  Data(
      {this.sId,
      this.title,
      this.date,
      this.content,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    date = json['date'];
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['date'] = date;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
