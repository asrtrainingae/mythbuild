import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myth/services/network/api_service.dart';
import 'dio_test.mocks.dart';
@GenerateMocks([ApiService])
void main(){
  ApiService dioService = ApiService();
  group('dio', () {
    test("success dio", () async {
      MockApiService();
      final _mockApi = ApiService(); //MockApiService();
      final res = await dioService.get("todos/1");
      print("REZ $res");
      // when(_mockApi.get("todos/1")).thenAnswer((res) async{
      //   print("SUCCESS $res");
      //   return Response(
      //     statusCode: 200,
      //     data: '{ "userId": 1, "id": 1, "title": "delectus aut autem", "completed": false }', requestOptions: RequestOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
      // }
      // );
      // expect("hello", isA<String>);
    });
  });
}

