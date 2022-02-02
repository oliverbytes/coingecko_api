import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Coin market data wrapper
class CoinPublicInterestsStats {
  /// Alexa rank
  final int? alexaRank;

  /// Bing matches
  final int? bingMatches;

  CoinPublicInterestsStats.fromJson(Map<String, dynamic> json)
      : this.alexaRank = Convert.toInt(json['alexa_rank']),
        this.bingMatches = Convert.toInt(json['bing_matches']);

  @override
  String toString() {
    return '${Helpers.getTypeName(CoinPublicInterestsStats)}';
  }
}
