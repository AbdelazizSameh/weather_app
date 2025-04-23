import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  WeatherServices(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'a4cfb7536c4d4e1d8ec44238251304';

  // Future<WeatherModel> getCurrentWeather({required String city}) async {
  //   try {
  //     var response = await dio.get(
  //       '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1',
  //     );

  //     return WeatherModel.fromJson(json: response.data, daysIndex: 0);
  //   } on DioException catch (e) {
  //     final String errorMessage =
  //         e.response?.data['error']['message'] ?? "Oops, there was an error";
  //     throw (errorMessage);
  //   } catch (e) {
  //     throw ('Oops, there was an error');
  //   }
  // }

  Future<WeatherModel> getOverallWeather({required String city}) async {
    try {
      var response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$city&days=7',
      );

      return WeatherModel.fromJson(json: response.data, daysIndex: 0);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? "Oops, there was an error";
      throw (errorMessage);
    } catch (e) {
      throw ('Oops, there was an error');
    }
  }
}
