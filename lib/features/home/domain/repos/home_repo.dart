import 'package:dartz/dartz.dart' show Either;
import 'package:nawel/features/home/data/models/service_model.dart';

abstract class HomeRepo {
  Future<Either<String, List<ServiceModel>>> fetchServices();
}
