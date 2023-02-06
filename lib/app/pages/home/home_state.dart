// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delivery_app/app/models/product_model.dart';

import '../../dto/order_product_dto.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shopBag;

  const HomeState({
    required this.status,
    required this.products,
    this.errorMessage,
    required this.shopBag,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shopBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, shopBag];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shopBag,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shopBag: shopBag ?? this.shopBag,
    );
  }
}
