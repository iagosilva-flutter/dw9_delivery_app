// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class OrderField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController textController;
  final FormFieldValidator validator;

  const OrderField({
    super.key,
    required this.title,
    required this.hintText,
    required this.textController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    const defBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: context.textStyles.textRegular
                .copyWith(overflow: TextOverflow.ellipsis, fontSize: 16),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: textController,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              border: defBorder,
              enabledBorder: defBorder,
              focusedBorder: defBorder,
            ),
          ),
        ],
      ),
    );
  }
}
