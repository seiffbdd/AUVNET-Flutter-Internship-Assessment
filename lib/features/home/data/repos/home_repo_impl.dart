import 'package:dartz/dartz.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/home/data/data_sources/firebase_firestore_service.dart';
import 'package:nawel/features/home/data/models/service_model.dart';
import 'package:nawel/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<String, List<ServiceModel>>> fetchServices() async {
    return await locator.get<FirebaseFirestoreService>().fetchServices();
  }
}
