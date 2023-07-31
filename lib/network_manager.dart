import 'package:dio/dio.dart';
import 'package:uap/game_model.dart';

class NetworkManager {
  late Dio _dio;

  String baseUrl = 'http://localhost:1337/api/games';
  NetworkManager() {
    _dio = Dio();
  }

  Future<GameModel> getAll() async {
    var response = await Dio().get(
      "$baseUrl/games",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return GameModel.fromJson(response.data);
  }
}
