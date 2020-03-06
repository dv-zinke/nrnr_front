import 'package:equatable/equatable.dart';


class Images extends Equatable {
  final int id;
  final String name;
  final String hash;
  final String sha256;
  final String ext;
  final String mime;
  final String text;
  final String size;
  final String url;
  final String provider;
  final int public_id;
  final String created_at;
  final String updated_at;

  const Images({ this.id, this.name, this.hash, this.sha256, this.ext, this.mime, this.text, this.size, this.url,
    this.provider, this.public_id, this.created_at, this.updated_at});

  factory Images.fromJson(dynamic json) {
    return Images();
  }

  @override
  List<Object> get props => [id, url, name, hash, sha256, ext, mime, text, size,  provider, public_id, created_at, updated_at];

  @override
  String toString() => 'http://49.50.163.40:1337$url';
}
