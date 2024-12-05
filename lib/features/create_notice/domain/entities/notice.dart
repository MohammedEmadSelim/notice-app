class Notice{
  final String title;
  final String description;
  final DateTime createDate;

  Notice(this.title, this.description, this.createDate);

  Map<String,dynamic> toJson(){
    return{
      "title":title,
      "description":description,
      "createdDate":createDate
    };
  }

}