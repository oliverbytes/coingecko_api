import 'package:coingecko_api/data/image_info.dart';
import 'package:coingecko_api/helpers/convert.dart';
import 'package:coingecko_api/helpers/helpers.dart';

/// Status update project data wrapper
class StatusUpdateProject {
  /// Project type
  final String type;

  /// Project identifier
  final String id;

  /// Project name
  final String name;

  /// Project symbol
  final String? symbol;

  /// Project image
  final ImageInfo? image;

  StatusUpdateProject.fromJson(Map<String, dynamic> json)
      : this.type = Convert.toStr(json['type'], ''),
        this.id = Convert.toStr(json['id'], ''),
        this.name = Convert.toStr(json['name'], ''),
        this.symbol = Convert.toStrN(json['symbol']),
        this.image = json.containsKey('image')
            ? ImageInfo.fromJson(json['image'])
            : null;

  @override
  String toString() {
    return '${Helpers.getTypeName(StatusUpdateProject)}: type = $type, id = $id, name = $name';
  }
}
