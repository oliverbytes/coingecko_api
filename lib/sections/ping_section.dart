import 'package:coingecko_api/coingecko_result.dart';
import 'package:dio/dio.dart';

class PingSection {
  final Dio _dio;

  const PingSection(this._dio);

  ///
  /// Check API server status
  ///
  /// * Coingecko API ( **GET** /ping )
  ///
  Future<CoinGeckoResult<bool>> ping() async {
    final response = await _dio.get(
      '/ping',
      options: Options(contentType: 'application/json'),
    );
    return CoinGeckoResult(
      response.statusCode == 200,
      errorCode: response.statusCode ?? null,
      errorMessage: '${response.statusMessage} - ${response.data.toString()}',
      isError: response.statusCode != 200,
    );
  }
}
