class BoardModel {
  String? b_no;
  String? b_id;
  String? b_user_nm;
  String? b_logo;
  String? b_img;
  String? b_subject;
  String? b_contents;
  String? b_tags;
  String? b_insert_dt;

  BoardModel(
      {this.b_no,
      this.b_id,
      this.b_user_nm,
      this.b_img,
      this.b_logo,
      this.b_subject,
      this.b_contents,
      this.b_tags,
      this.b_insert_dt});

  factory BoardModel.fromJson(Map<String, dynamic> json) => BoardModel(
        b_no: json['b_no'],
        b_id: json['b_id'],
        b_user_nm: json['b_user_nm'],
        b_img: json['b_img'],
        b_logo: json['logo'],
        b_subject: json['b_subject'],
        b_contents: json['b_contents'],
        b_tags: json['b_tags'],
        b_insert_dt: json['b_insert_dt'],
      );
}
