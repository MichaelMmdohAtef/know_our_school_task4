//TODO: add your model class here
class DataModel{
  String? schoolName;
  String? schoolAddress;
  String? numberOfStudents;
  String? numberOfTeachers;

  DataModel.fromjson(Map<String,dynamic> json){
    this.schoolName=json['School Name'];
    this.schoolAddress=json['School Address'];
    this.numberOfStudents=json['Number of Students'];
    this.numberOfTeachers=json['Number of Teachers'];
  }

}
