// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/Signin/data/dataSource/signin_dao.dart' as _i804;
import '../../features/auth/Signin/data/dataSource/signin_dao_impl/signin_dao_impl.dart'
    as _i998;
import '../../features/auth/Signin/data/repository/signin_repo_impl.dart'
    as _i175;
import '../../features/auth/Signin/domain/repository/signin_repo.dart' as _i193;
import '../../features/auth/Signin/domain/useCase/signin_use_case.dart'
    as _i790;
import '../../features/auth/Signin/presentation/manager/cubit/signin_view_model_cubit.dart'
    as _i165;
import '../../features/auth/Signup/data/dataSource/Dao_impl/signup_dao_impl.dart'
    as _i759;
import '../../features/auth/Signup/data/dataSource/signup_dao.dart' as _i708;
import '../../features/auth/Signup/data/repository/signup_repo_impl.dart'
    as _i192;
import '../../features/auth/Signup/domain/repository/signup_repo.dart' as _i930;
import '../../features/auth/Signup/domain/useCase/signup_use_case.dart'
    as _i779;
import '../../features/auth/Signup/presentation/manager/cubit/signup_view_model_cubit.dart'
    as _i17;
import '../../features/main_layout/categories/data/DataSource/DaoImpil/Dao_Impl.dart'
    as _i61;
import '../../features/main_layout/categories/data/DataSource/sub_categories_dao.dart'
    as _i13;
import '../../features/main_layout/categories/data/repository/sub_categories_repo_impl.dart'
    as _i143;
import '../../features/main_layout/categories/domain/repository/sub_categories_repo.dart'
    as _i989;
import '../../features/main_layout/categories/domain/UseCase/Categories_Use_Case.dart'
    as _i779;
import '../../features/main_layout/categories/presentation/manager/cubit/catigories_cubit.dart'
    as _i884;
import '../../features/main_layout/home/data/dataSource/DaoImpl/HomeDaoImpi.dart'
    as _i37;
import '../../features/main_layout/home/data/dataSource/HomeDao.dart' as _i833;
import '../../features/main_layout/home/data/repository/Home_Repo_impl.dart'
    as _i775;
import '../../features/main_layout/home/domain/repository/Categories_Repo.dart'
    as _i634;
import '../../features/main_layout/home/domain/useCase/home_use_case.dart'
    as _i932;
import '../../features/main_layout/home/presentation/manager/home_view_model_cubit.dart'
    as _i416;
import '../../features/products_screen/data/DataSource/DaoImpl/Dao_Impl.dart'
    as _i220;
import '../../features/products_screen/data/DataSource/Products_Dao.dart'
    as _i448;
import '../../features/products_screen/data/repository/products_repo_impl.dart'
    as _i347;
import '../../features/products_screen/domain/repository/products_repo.dart'
    as _i75;
import '../../features/products_screen/domain/UseCase/products_use_case.dart'
    as _i1065;
import '../../features/products_screen/presentation/manager/cubit/products_view_model_cubit.dart'
    as _i674;
import '../remote/api_manger.dart' as _i14;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i14.ApiManger>(() => _i14.ApiManger());
    gh.factory<_i13.SubCategoriesDao>(
      () => _i61.SubCategoriesDaoImpl(gh<_i14.ApiManger>()),
    );
    gh.factory<_i804.SigninDao>(
      () => _i998.SigninDaoImpl(gh<_i14.ApiManger>()),
    );
    gh.factory<_i708.SignupDao>(
      () => _i759.SignupDaoImpl(gh<_i14.ApiManger>()),
    );
    gh.factory<_i833.HomeDao>(() => _i37.HomeDaoImpi(gh<_i14.ApiManger>()));
    gh.factory<_i448.ProductsDao>(() => _i220.DaoImpl(gh<_i14.ApiManger>()));
    gh.factory<_i193.SigninRepo>(
      () => _i175.SigninRepoImpl(gh<_i804.SigninDao>()),
    );
    gh.factory<_i634.HomeRepo>(() => _i775.HomeRepoImpl(gh<_i833.HomeDao>()));
    gh.factory<_i930.SignupRepo>(
      () => _i192.SignupRepoImpl(gh<_i708.SignupDao>()),
    );
    gh.factory<_i989.SubCategoriesRepo>(
      () => _i143.SubCategoriesRepoImpl(gh<_i13.SubCategoriesDao>()),
    );
    gh.factory<_i779.SignupUseCase>(
      () => _i779.SignupUseCase(gh<_i930.SignupRepo>()),
    );
    gh.factory<_i790.SigninUseCase>(
      () => _i790.SigninUseCase(gh<_i193.SigninRepo>()),
    );
    gh.factory<_i165.SigninViewModelCubit>(
      () => _i165.SigninViewModelCubit(gh<_i790.SigninUseCase>()),
    );
    gh.factory<_i75.ProductsRepo>(
      () => _i347.ProductsRepoImpl(gh<_i448.ProductsDao>()),
    );
    gh.factory<_i932.HomeUseCase>(
      () => _i932.HomeUseCase(gh<_i634.HomeRepo>()),
    );
    gh.factory<_i779.SubCategoriesUseCase>(
      () => _i779.SubCategoriesUseCase(gh<_i989.SubCategoriesRepo>()),
    );
    gh.factory<_i884.CategoriesCubit>(
      () => _i884.CategoriesCubit(
        gh<_i932.HomeUseCase>(),
        gh<_i779.SubCategoriesUseCase>(),
      ),
    );
    gh.factory<_i416.HomeViewModelCubit>(
      () => _i416.HomeViewModelCubit(gh<_i932.HomeUseCase>()),
    );
    gh.factory<_i17.SignupViewModelCubit>(
      () => _i17.SignupViewModelCubit(gh<_i779.SignupUseCase>()),
    );
    gh.factory<_i1065.ProductsUseCase>(
      () => _i1065.ProductsUseCase(gh<_i75.ProductsRepo>()),
    );
    gh.factory<_i674.ProductsViewModelCubit>(
      () => _i674.ProductsViewModelCubit(gh<_i1065.ProductsUseCase>()),
    );
    return this;
  }
}
