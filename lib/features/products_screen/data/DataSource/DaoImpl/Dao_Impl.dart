import 'package:dartz/dartz.dart';
import 'package:ecom/core/remote/api_manger.dart';
import 'package:ecom/core/remote/endpoints.dart';
import 'package:ecom/features/products_screen/data/DataSource/Products_Dao.dart';
import 'package:ecom/features/products_screen/data/model/ProductsModel/products_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsDao)
class DaoImpl extends ProductsDao {
  ApiManger apiManger;
  @factoryMethod
  DaoImpl(this.apiManger);
  @override
  Future<Either<ProductsModelResponse, String>> getAllProducts() async {

    try {
      var json = await apiManger.getRequest(
        path: Endpoints.allProducts,);
      var response = ProductsModelResponse.fromJson(json.data);
      if (response.message == null) {
        return Left(response);
      } else {
        return Right(response.message!);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
  
  @override
  Future<Either<ProductsModelResponse, String>> getCategorieProducts(
    String categorieId,
  ) async {
      try {
      var json = await apiManger.getRequest(
        path: Endpoints.allProducts,
        queryParameters: {
          'category[in]':categorieId,
        }
        );
      var response = ProductsModelResponse.fromJson(json.data);
      if (response.message == null) {
        return Left(response);
      } else {
        return Right(response.message!);
      }
    } catch (error) {
      return Right(error.toString());
    }
  }
  }

