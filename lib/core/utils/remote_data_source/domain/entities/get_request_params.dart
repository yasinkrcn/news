
import 'package:news/core/utils/remote_data_source/domain/entities/main_endpoint.dart';

class GetRequestParams {
  final MainEndpoints endPoint;
 
  Map<String,dynamic>? queryparameters;

  GetRequestParams({required this.endPoint,  this.queryparameters});
}
