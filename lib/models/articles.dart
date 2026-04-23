class Article {
  late String sourceID;
  late String sourceName;
  late String author;
  late String title;
  late String description;
  late String url;
  late String imageURL;
  late String publishDate;
  late String content;
  Article({
    required this.sourceID,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageURL,
    required this.publishDate,
    required this.content,
  });
  Article.fromJSON(Map<String,dynamic> article){
    sourceID = article['source']['id'];
    sourceName = article['source']['name'];
    author = article['author'];
    title = article['title'];
    description = article['description'];
    url = article['url'];
    imageURL = article['urlToImage'];
    publishDate = article['publishedAt'];
    content = article['content'];
  }
}
