import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failures, List<ProductEntity>>> getProduts();
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}
