import 'package:dw9_delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_inc_dec_button.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/pages/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderProductTile extends StatelessWidget {
  final int index;
  final OrderProductDto orderProduct;

  const OrderProductTile(
      {super.key, required this.index, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          orderProduct.product.image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${orderProduct.product.name} - ${orderProduct.product.price.currencyPTBR}',
                  style: context.textStyles.textRegular.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (orderProduct.product.price * orderProduct.amount)
                          .currencyPTBR,
                      style: context.textStyles.textRegular.copyWith(
                          fontSize: 14, color: context.colors.secondary),
                    ),
                    DeliveryIncDecButton(
                      amout: orderProduct.amount,
                      incrementTap: () {
                        context.read<OrderController>().incrementProduct(index);
                      },
                      decrementTap: () {
                        context.read<OrderController>().decrementProduct(index);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}