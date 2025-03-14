import 'package:dartz/dartz.dart';
import 'package:myth/data_model/auth/user.dart';
import 'package:myth/features/auth/data/model/request_models.dart';
import 'package:myth/services/dependency_injector.dart';
import 'package:myth/services/network/api_service.dart';
import 'package:myth/services/network/models/error_response.dart';
import 'package:myth/utils/local_storage.dart';
import 'package:myth/utils/server/end_points.dart';
abstract class DevelopmentRepo {
  Future<Either> getData();
}

class DevelopmentRepoImpl extends DevelopmentRepo{
  final apiService = sl<ApiService>();
  @override
  Future<Either> getData() async {
    final res = await apiService.get(EndPoints.getDevelopment);
    if(res is ErrorResponse){
      return left(res.message);
    }
    else{
      return right(res["data"]);
    }
  }
}