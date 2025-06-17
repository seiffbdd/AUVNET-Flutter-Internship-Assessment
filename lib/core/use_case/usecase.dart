/// A generic interface for use cases in a clean architecture pattern.
/// [Type] is the return type of the use case.
/// [Params] is the type of parameters required to execute the use case.
abstract class Usecase<Type, Params> {
  Future<Type> call({Params params});
}
