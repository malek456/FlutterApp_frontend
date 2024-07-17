

class Categorycourse{
  String id;
  String title;
  //String description;

  Categorycourse({required this.id,required this.title});
   // , required this.description});

  factory Categorycourse.fromJson(Map<String, dynamic> json) {
    return Categorycourse(
      id: json['_id'] ?? 0,
      title: json['title'] ?? 'Unknown',
      //description: json['description'],

    );
  }


}