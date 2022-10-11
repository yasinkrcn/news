class ListNewsArguments {
  String? category;
  final String? sources;
  final String? q;
  final String? language;
  final String? country;
  final int pageSize;
  int page;

  ListNewsArguments({
    this.category ,
    this.sources,
    this.q,
    this.language = 'tr',
    this.country,
     this.pageSize = 5,
     this.page = 1,
  });

  Map<String,dynamic> toMap(){
    return {
        'category': category,
        'sources': sources,
        'q': q,
        'country': country,
        'language': language,
        'pageSize': pageSize,
        'page': page
      };
  }
}
