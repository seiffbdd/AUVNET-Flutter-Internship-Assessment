import 'package:dartz/dartz.dart';
import 'package:nawel/core/use_case/usecase.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/home/data/models/service_model.dart';
import 'package:nawel/features/home/domain/repos/home_repo.dart';

class FetchServicesUseCase
    implements Usecase<Either<String, List<ServiceModel>>, void> {
  @override
  Future<Either<String, List<ServiceModel>>> call({void params}) async {
    return await locator.get<HomeRepo>().fetchServices();
  }
}
