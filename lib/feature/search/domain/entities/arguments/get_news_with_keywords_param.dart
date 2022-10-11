class GetNewsListWithKeywordsParam {
  final String keyword;
  final String? language;
  final String? sortBy;
  final int pageSize;
  final int page;

  GetNewsListWithKeywordsParam({
    required this.keyword,
    this.language,
     this.sortBy = 'publishedAt' ,
    required this.pageSize,
    required this.page,
    
  });

  //? bunu buraya koymak mantıklı mı?
  Map<String,dynamic>  toMap(){
    return {
        'q': keyword,
        'language': language,
        'sortBy': sortBy,
        'pageSize': pageSize,
        'page': page
      };
  }
}
