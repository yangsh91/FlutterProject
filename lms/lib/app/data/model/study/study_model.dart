class StudyModel {
  String? exam_no;
  String? exam_nm;
  String? exam_st;
  String? exam_et;

  StudyModel({exam_no, exam_nm, exam_st, exam_et});

  StudyModel.fromJson(Map<String, dynamic> json) {
    this.exam_no = json['exam_no'];
    this.exam_nm = json['exam_nm'];
    this.exam_st = json['exam_st'];
    this.exam_et = json['exam_et'];
  }
}
