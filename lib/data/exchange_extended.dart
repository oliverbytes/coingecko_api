import 'package:coingecko_api/data/ticker.dart';
import 'package:coingecko_api/data/status_update.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Exchange extended data wrapper
class ExchangeExtended {
  /// Exchange name
  final String name;

  /// The year in which the exchange was established
  final int yearEstablished;

  /// Country of the company
  final String country;

  /// Exchange description
  final String description;

  /// Exchange url
  final String url;

  /// Exchange image
  final String image;

  /// Facebook url
  final String facebookUrl;

  /// Reddit url
  final String redditUrl;

  /// Telegram url
  final String telegramUrl;

  /// Slack url
  final String slackUrl;

  /// Other url 1
  final String otherUrl1;

  /// Other url 2
  final String otherUrl2;

  /// Twitter handle
  final String twitterHandle;

  /// Indicates if the exchange has a trading incentive
  final bool hasTradingIncentive;

  /// Indicates if the exchange is centralized
  final bool centralized;

  /// Public notice
  final String publicNotice;

  /// Alert notice
  final String alertNotice;

  /// Trust score
  final int trustScore;

  /// Trust score rank
  final int trustScoreRank;

  /// Exchange trade volume in BTC in 24 hours
  final double tradeVolume24hBtc;

  /// Exchange trade volume (normalized) in BTC in 24 hours
  final double tradeVolume24hBtcNormalized;

  /// List of tickers
  final List<Ticker> tickers;

  /// List of status updates
  final List<StatusUpdate> statusUpdates;

  static List<Ticker> _parseTickers(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null
        ? jsonList.map((e) => Ticker.fromJson(e)).toList()
        : [];
  }

  static List<StatusUpdate> _parseStatusUpdates(dynamic json) {
    final jsonList = Convert.toList(json);
    return jsonList != null
        ? jsonList.map((e) => StatusUpdate.fromJson(e)).toList()
        : [];
  }

  ExchangeExtended.fromJson(Map<String, dynamic> json)
      : this.name = Convert.toNotNullableString(json['name'], ''),
        this.yearEstablished = Convert.toInt(json['year_established']) ?? 0,
        this.country = Convert.toNotNullableString(json['country'], ''),
        this.description = Convert.toNotNullableString(json['description'], ''),
        this.url = Convert.toNotNullableString(json['url'], ''),
        this.image = Convert.toNotNullableString(json['image'], ''),
        this.facebookUrl =
            Convert.toNotNullableString(json['facebook_url'], ''),
        this.redditUrl = Convert.toNotNullableString(json['reddit_url'], ''),
        this.telegramUrl =
            Convert.toNotNullableString(json['telegram_url'], ''),
        this.slackUrl = Convert.toNotNullableString(json['slack_url'], ''),
        this.otherUrl1 = Convert.toNotNullableString(json['other_url_1'], ''),
        this.otherUrl2 = Convert.toNotNullableString(json['other_url_2'], ''),
        this.twitterHandle =
            Convert.toNotNullableString(json['twitter_handle'], ''),
        this.hasTradingIncentive =
            Convert.toNotNullableBoolean(json['has_trading_incentive'], false),
        this.centralized =
            Convert.toNotNullableBoolean(json['centralized'], false),
        this.publicNotice =
            Convert.toNotNullableString(json['public_notice'], ''),
        this.alertNotice =
            Convert.toNotNullableString(json['alert_notice'], ''),
        this.trustScore = Convert.toInt(json['trust_score']) ?? 0,
        this.trustScoreRank = Convert.toInt(json['trust_score_rank']) ?? 0,
        this.tradeVolume24hBtc =
            Convert.toDouble(json['trade_volume_24h_btc']) ?? 0,
        this.tradeVolume24hBtcNormalized =
            Convert.toDouble(json['trade_volume_24h_btc_normalized']) ?? 0,
        this.tickers = _parseTickers(json['tickers']),
        this.statusUpdates = _parseStatusUpdates(json['status_updates']);

  @override
  String toString() {
    return '${Helpers.getTypeName(ExchangeExtended)}: name = $name, url = $url';
  }
}
