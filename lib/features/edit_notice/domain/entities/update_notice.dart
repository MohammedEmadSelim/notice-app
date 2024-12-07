class UpdateNotice{
  final String id;
  final String title;
  final String description;
  final DateTime createDate;

  UpdateNotice(this.id,this.title, this.description, this.createDate);

  Map<String,dynamic> toJson(){
    return{
      "title":title,
      "description":description,
      "createdDate":createDate
    };
  }

}