class NoticeModel {
  String? no;
  String? subject;
  String? contents;
  String? nickname;
  String? insert_dt;

  NoticeModel({no, subject, contents, nickname, insert_dt});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    this.no = json['no'];
    this.subject = json['subject'];
    this.contents = json['contents'];
    this.nickname = json['nickname'];
    this.insert_dt = json['insert_dt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['no'] = this.no;
    data['subject'] = this.subject;
    data['contents'] = this.contents;
    data['nickname'] = this.nickname;
    data['insert_dt'] = this.insert_dt;

    return data;
  }
}
