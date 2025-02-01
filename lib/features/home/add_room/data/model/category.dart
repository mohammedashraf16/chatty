class Category{
  static const String sportsId = "sports";
  static const String moviesId = "movies";
  static const String musicId = "music";
  String id ;
  late String title;
  late String image;

  Category({required this.id, required this.title, required this.image});

  Category.fromId(this.id){
    if(id == sportsId){
      title ="sports";
      image ="assets/images/sports.png";
    }else if(id == moviesId){
      title ="movies";
      image ="assets/images/movies.png";
    }else if(id == musicId){
      title ="music";
      image ="assets/images/music.png";
    }
  }

  static List<Category>getCategory(){
    return [
    Category(id: sportsId, title: "sports", image: "assets/images/sports.png"),
    Category(id: moviesId, title: "movies", image: "assets/images/movies.png"),
    Category(id: musicId, title: "music", image: "assets/images/music.png"),
    ];
  }
}