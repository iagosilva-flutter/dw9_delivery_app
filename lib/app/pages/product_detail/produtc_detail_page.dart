import 'package:dw9_delivery_app/app/core/extensions/formatter_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/delivery_appbar.dart';
import '../../core/ui/widgets/delivery_inc_dec_button.dart';
import '../../dto/order_product_dto.dart';

class ProdutcDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;

  const ProdutcDetailPage({
    super.key,
    required this.product,
    this.order,
  });

  @override
  State<ProdutcDetailPage> createState() => _ProdutcDetailPageState();
}

class _ProdutcDetailPageState
    extends BaseState<ProdutcDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amount ?? 1;
    controller.initial(amount, widget.order != null);
  }

  void _showConfirmDelete() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deseja retirar o produto da sacola?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Não',
                  style:
                      context.textStyles.textBold.copyWith(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(
                    OrderProductDto(amount: 0, product: widget.product),
                  );
                },
                child: Text(
                  'Sim',
                  style: context.textStyles.textBold,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.screenWidth,
              height: context.percentHeight(.4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.product.name,
                style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Text(
                    widget.product.description,
                    style: context.textStyles.textMedium.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: context.percentWidth(.45),
                    height: 68,
                    padding: const EdgeInsets.all(8),
                    child: BlocBuilder<ProductDetailController, int>(
                      builder: (context, amount) {
                        return DeliveryIncDecButton(
                          amout: amount,
                          incrementTap: () {
                            controller.increment();
                          },
                          decrementTap: () {
                            controller.decrement();
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    width: context.percentWidth(.45),
                    height: 68,
                    padding: const EdgeInsets.all(8),
                    child: BlocBuilder<ProductDetailController, int>(
                      builder: (context, amount) {
                        return ElevatedButton(
                          style: amount < 1
                              ? ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red)
                              : null,
                          onPressed: () {
                            if (amount > 0) {
                              Navigator.of(context).pop(
                                OrderProductDto(
                                    amount: amount, product: widget.product),
                              );
                            } else {
                              _showConfirmDelete();
                            }
                          },
                          child: Visibility(
                            visible: amount > 0,
                            replacement: Text(
                              'Excluir produto',
                              style: context.textStyles.textExtraBold,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Adicionar'),
                                FittedBox(
                                  child: Text((widget.product.price * amount)
                                      .currencyPTBR),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
