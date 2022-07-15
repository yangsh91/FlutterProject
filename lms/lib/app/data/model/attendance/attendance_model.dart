class AttendanceModel {
  String? atd_dt;
  String? id;
  String? in_chk_dt;
  String? out_chk_dt;

  String? atd_seq;
  String? atd_io;
  String? atd_dttm;
  String? atd_gubun;
  String? atd_dtl;
  String? atd_memo;

  AttendanceModel(
      {atd_dt,
      id,
      in_chk_dt,
      out_chk_dt,
      atd_seq,
      atd_io,
      atd_dttm,
      atd_gubun,
      atd_dtl,
      atd_memo});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    this.atd_dt = json['atd_dt'];
    this.id = json['id'];
    this.in_chk_dt = json['in_chk_dt'];
    this.out_chk_dt = json['out_chk_dt'];
  }

  AttendanceModel.fromDetailJson(Map<String, dynamic> json) {
    this.atd_seq = json['atd_seq'];
    this.atd_dt = json['atd_dt'];
    this.atd_io = json['atd_io'];
    this.atd_gubun = json['atd_gubun'];
    this.atd_dtl = json['atd_dtl'];
    this.atd_memo = json['atd_memo'];
    this.atd_dttm = json['atd_dttm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['atd_dt'] = this.atd_dt;
    data['id'] = this.id;
    data['in_chk_dt'] = this.in_chk_dt;
    data['out_chk_dt'] = this.out_chk_dt;

    return data;
  }
}
