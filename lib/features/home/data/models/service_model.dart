import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  final String image;
  final String title;
  final String time;

  ServiceModel({required this.image, required this.title, required this.time});

  factory ServiceModel.fromJson(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    return ServiceModel(
      image: data['image'],
      title: data['title'],
      time: data['time'],
    );
  }
}
