class NoticeModel {
  String? notice_no;
  String? id;
  String? subject;
  String? contents;
  String? nickname;
  String? insert_dt;
  String? update_dt;

  NoticeModel(
      {this.notice_no,
      this.id,
      this.subject,
      this.contents,
      this.nickname,
      this.insert_dt,
      this.update_dt});
  /*
  NoticeModel.fromJson(Map<String, dynamic> json) {
    this.notice_no = json['notice_no'];
    this.id = json['id'];
    this.subject = json['subject'];
    this.contents = json['contents'];
    this.nickname = json['nickname'];
    this.insert_dt = json['insert_dt'];
    this.update_dt = json['update_dt'];
  }
  */

  factory NoticeModel.fromJson(Map<String, dynamic> json) => NoticeModel(
        notice_no: json['notice_no'],
        id: json['id'],
        subject: json['subject'],
        contents: json['contents'],
        nickname: json['nickname'],
        insert_dt: json['insert_dt'],
        update_dt: json['update_dt'],
      );

  factory NoticeModel.toJson(Map<String, dynamic> json) => NoticeModel(
        notice_no: json['notice_no'],
        id: json['id'],
        subject: json['subject'],
        contents: json['contents'],
        nickname: json['nickname'],
        insert_dt: json['insert_dt'],
        update_dt: json['update_dt'],
      );
}
