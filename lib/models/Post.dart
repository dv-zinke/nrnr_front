import 'package:equatable/equatable.dart';
import 'package:nrnr/models/Images.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String city;
  final String address;
  final String deposit;
  final String phone;
  final String text;
  final String start_at;
  final String end_at;
  final String home;
  final int period;
  final int rent_price;
  final String created_at;
  final String updated_at;
  final List images;



  const Post({ this.id, this.title, this.city, this.address, this.deposit, this.phone, this.text, this.start_at, this.end_at,
  this.home, this.period, this.rent_price, this.created_at, this.updated_at, this.images});

  @override
  List<Object> get props => [id, title, city, address, deposit, phone, text, start_at,
    end_at, home, period, rent_price, created_at, updated_at, images];

  @override
  String toString() => 'Post { id: $id }';
}
