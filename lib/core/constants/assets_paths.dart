class AssetsPath {
  static final AssetsPath _instance = AssetsPath._init();
  AssetsPath._init();

  factory AssetsPath() {
    return _instance;
  }

  // !SVG
  String logoSVG = 'assets/svg/logo.svg';
  static const String businessSVG = 'assets/svg/business.svg';
  static const String entertainmentSVG = 'assets/svg/entertainment.svg';
  static const String generalSVG = 'assets/svg/general.svg';
  static const String healthSVG = 'assets/svg/health.svg';
  static const String scienceSVG = 'assets/svg/science.svg';
  static const String technologySVG = 'assets/svg/technology.svg';
  static const String sportSVG = 'assets/svg/sport.svg';
  String searchStateEmptySVG = 'assets/svg/search_state_empty.svg';
}
