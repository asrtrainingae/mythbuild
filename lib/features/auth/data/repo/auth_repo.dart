import 'package:dartz/dartz.dart';
import 'package:myth/data_model/auth/user.dart';
import 'package:myth/features/auth/data/model/request_models.dart';
import 'package:myth/services/dependency_injector.dart';
import 'package:myth/services/network/api_service.dart';
import 'package:myth/services/network/models/error_response.dart';
import 'package:myth/utils/local_storage.dart';
import 'package:myth/utils/server/end_points.dart';
abstract class AuthRepo {
  Future<Either> signup({required SignupRequest  data});
  Future<Either> login({required LoginRequestModel data});
}

class AuthRepoImpl extends AuthRepo{
  final apiService = sl<ApiService>();
  @override
  Future<Either> signup({required SignupRequest data}) async {
    final res = await apiService.post(EndPoints.signup , data:data.toJson());
    if(res is ErrorResponse){
      return left(res.message);
    }
    else{
      return right(data);
    }
  }

  @override
  Future<Either> login({required LoginRequestModel data}) async {
    final res = await apiService.post(EndPoints.loginD , data:data.toJson());
    if(res is ErrorResponse){
      return left(res.message);
    }else{
      // return left(res["data"]["token"]);
      LocalStorage.addData("token", res["data"]["token"]);
      final res2 = await apiService.get(res["data"]["roles"][0]=="doctor"?EndPoints.getMyInfoDoctor2:EndPoints.getMyInfo);
       if(res2 is ErrorResponse){
          return left(res2.message);
        }else{
          final user = User.fromJson(res2["data"]);
          user.isDoctor =  res["data"]["roles"][0]=="doctor"?true: false;
          user.isDoctor = true;
          return right(user);  
        }
    }
  }
}