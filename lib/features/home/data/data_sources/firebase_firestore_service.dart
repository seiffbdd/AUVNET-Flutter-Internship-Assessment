import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:nawel/core/constants/strings.dart';
import 'package:nawel/features/home/data/models/service_model.dart';

abstract class FirebaseFirestoreService {
  Future<Either<String, List<ServiceModel>>> fetchServices();
}

class FirebaseFirestoreServiceImpl implements FirebaseFirestoreService {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<Either<String, List<ServiceModel>>> fetchServices() async {
    try {
      final snapshot = await _firestore.collection(servicesCollectionRef).get();
      List<ServiceModel> services =
          snapshot.docs
              .map((service) => ServiceModel.fromJson(service))
              .toList();
      return right(services);
    } catch (e) {
      debugPrint('error from  fetching services => ${e.toString()}');
      return left(e.toString());
    }
  }
}
