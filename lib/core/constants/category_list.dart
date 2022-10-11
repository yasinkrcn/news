import 'package:news/core/constants/assets_paths.dart';
import 'package:news/feature/home/domain/entities/category_entity.dart';


const List<CategoryEntitiy> kEntities = [
  CategoryEntitiy(categoryName: 'Business', assethPath: AssetsPath.businessSVG),
  CategoryEntitiy(
      categoryName: 'Entertainment', assethPath: AssetsPath.entertainmentSVG),
  CategoryEntitiy(categoryName: 'General', assethPath: AssetsPath.generalSVG),
  CategoryEntitiy(categoryName: 'Health', assethPath: AssetsPath.healthSVG),
  CategoryEntitiy(categoryName: 'Science', assethPath: AssetsPath.scienceSVG),
  CategoryEntitiy(categoryName: 'Sports', assethPath: AssetsPath.sportSVG),
  CategoryEntitiy(
      categoryName: 'Technology', assethPath: AssetsPath.technologySVG),
];
