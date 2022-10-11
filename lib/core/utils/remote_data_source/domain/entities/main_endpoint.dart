enum MainEndpoints {
  topHeadlines,
  everything,
  sources,
}

extension MainEndPointExtension on MainEndpoints {
  String get path {
    switch (this) {
      case MainEndpoints.topHeadlines:
        return 'v2/top-headlines';
      case MainEndpoints.everything:
        return 'v2/everything';
      case MainEndpoints.sources:
        return 'v2/top-headlines/sources';
    }
  }
}


