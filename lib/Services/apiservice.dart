import 'package:dio/dio.dart';
import 'package:washintimeassing/Model/responsemodel.dart';
import 'package:washintimeassing/constant.dart';

class ApiService {
  final String? baseUrl = AppConstants().mockURL;
  final Dio dio = Dio();
  Future getRequest(String? url) async {
    try {
      Response response = await dio.get(baseUrl!);
      return ResponseModel.fromJson(response.data);
    } on DioError {
      return ResponseModel(problems: []);
    } catch (e) {
      return ResponseModel(problems: []);
    }
  }
}