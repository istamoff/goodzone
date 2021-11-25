import 'package:get/get.dart';
import 'package:goodzone/base/base_controller.dart';
import 'package:goodzone/data/model/banner/banner_response.dart';
import 'package:goodzone/data/model/brand/brand.dart';
import 'package:goodzone/data/model/featured/featured_response.dart';
import 'package:goodzone/data/model/promo/promo_response.dart';
import 'package:goodzone/data/repository/home/home_repository.dart';

class HomeController extends BaseController {
  final HomeRepository? repository;

  HomeController({
    required this.repository,
  }) : assert(repository != null);

  List<Banners> _banners = [];
  List<Promos> _promos = [];
  List<Brands> _brands = [];
  List<FeaturedList> _featureproducts = [];

  @override
  void onInit() {
    getBanners();
    getPromos();
    getBrands();
    getFProducts();
    super.onInit();
  }

  Future<void> getBanners() async {
    setLoading(true);
    final result = await repository?.getBanners();
    if (result is BannerResponse) {
      _banners = result.banners ?? [];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }

  Future<void> getPromos() async {
    setLoading(true);
    final result = await repository?.getPromos();
    if (result is PromoResponse) {
      _promos = result.promos ?? [];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }

  Future<void> getBrands() async {
    setLoading(true);
    final result = await repository?.getBrands();
    if (result is BrandsResponse) {
      _brands = result.brands ?? [];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }

  Future<void> getFProducts() async {
    setLoading(true);
    final result = await repository?.getFProducts();
    if (result is FeaturedResponse) {
      _featureproducts = result.featuredLists ?? [];
      update();
    } else {
      showError(result);
    }
    setLoading(false);
  }

  List<Banners> get banners => _banners;

  List<Promos> get promos => _promos;

  List<Brands> get brands => _brands;

  List<FeaturedList> get featureproducts => _featureproducts;
}
