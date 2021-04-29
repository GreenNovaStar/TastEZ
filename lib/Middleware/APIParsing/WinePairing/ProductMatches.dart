class ProductMatches {
  int id;
  String title;
  String description;
  String price;
  String imageUrl;
  double averageRating;
  double ratingCount;
  double score;
  String link;

  ProductMatches({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.averageRating,
    this.ratingCount,
    this.score,
    this.link
  });

  ProductMatches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
    score = json['score'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['averageRating'] = this.averageRating;
    data['ratingCount'] = this.ratingCount;
    data['score'] = this.score;
    data['link'] = this.link;
    return data;
  }
}