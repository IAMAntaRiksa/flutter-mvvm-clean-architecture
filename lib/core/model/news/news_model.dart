class NewsModel {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? imageUrl;

  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source:
          json['source'] != null ? SourceModel.fromJson(json['source']) : null,
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}

class SourceModel {
  String? id;
  String? name;

  SourceModel({this.id, this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'].toString(),
      name: json['name'] ?? "",
    );
  }
}
