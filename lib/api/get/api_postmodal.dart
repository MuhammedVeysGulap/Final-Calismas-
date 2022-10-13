class PostModel {

  String? title;


  PostModel({ this.title, });

  PostModel.fromJson(Map<String, dynamic> json) {
    
    title = json['title'];
    
  }

 
}
