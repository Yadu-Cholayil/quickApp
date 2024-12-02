import 'package:dartz/dartz.dart';
import 'package:quick_task/constants/constants.dart';
import 'package:quick_task/repository/network/dio_client.dart';

abstract class MainRepo {
  Future<Either> userLogin();
}

class MainRepoImpl extends MainRepo {
  @override
  Future<Either> userLogin() async {
    final response = await DioClient().get("${Constants.PARSE_APP_URL}login");
    if (response.statusCode != 200 && response.statusCode != 201) {
      return Left(response.statusMessage.toString());
    }
    return Right(response);
  }
}
