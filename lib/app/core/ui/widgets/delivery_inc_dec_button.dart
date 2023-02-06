import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryIncDecButton extends StatelessWidget {
  final bool _compact;
  final int amout;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  const DeliveryIncDecButton(
      {super.key,
      required this.amout,
      required this.incrementTap,
      required this.decrementTap})
      : _compact = false;

  const DeliveryIncDecButton.compact(
      {super.key,
      required this.amout,
      required this.incrementTap,
      required this.decrementTap})
      : _compact = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _compact ? const EdgeInsets.all(8) : null,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '-',
                style: context.textStyles.textMedium
                    .copyWith(fontSize: _compact ? 13 : 22, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              amout.toString(),
              style: context.textStyles.textMedium.copyWith(
                  fontSize: _compact ? 15 : 17,
                  color: context.colors.secondary),
            ),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '+',
                style: context.textStyles.textMedium.copyWith(
                    fontSize: _compact ? 13 : 22,
                    color: context.colors.secondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
