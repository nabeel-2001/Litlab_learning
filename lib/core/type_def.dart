import 'package:fpdart/fpdart.dart';
import 'package:litlab_learning/core/common/widgets/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;