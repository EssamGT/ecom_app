class Endpoints {
  static const String singIn = "/api/v1/auth/signin";
  static const String singUp = "/api/v1/auth/signup";
  static const String Categories = "/api/v1/categories";
  static  String subCategories (String id)=> "/api/v1/categories/$id/subcategories";
  static  String allBrands = "/api/v1/brands";
  static  String allProducts = "/api/v1/products";
}
