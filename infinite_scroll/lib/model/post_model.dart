import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int id;
  final String title;
  final String body;

  PostModel({this.id, this.title, this.body}) : super([id, title, body]);

  @override
  String toString() => 'PostModel {id : $id}';
}
