import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/pages/home/home_state.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';

import '../../dto/order_product_dto.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));

    try {
      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'erro ao buscar produtos',
        ),
      );
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shopBag = [...state.shopBag];
    final orderIndex =
        shopBag.indexWhere((op) => op.product == orderProduct.product);

    if (orderIndex > -1) {
      orderProduct.amount == 0
          ? shopBag.removeAt(orderIndex)
          : shopBag[orderIndex] = orderProduct;
    } else {
      shopBag.add(orderProduct);
    }
    emit(state.copyWith(shopBag: shopBag));
  }

  void updateBag(List<OrderProductDto> updateBag) {
    emit(state.copyWith(shopBag: updateBag));
  }
}
