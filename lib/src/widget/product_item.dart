import 'package:flutter/material.dart';
import 'package:sidompul/src/helper/utils.dart';
import 'package:sidompul/src/models/productist_response.dart';

class PrductItem extends StatelessWidget {
  final XLProduct product;
  final int selisih;
  final Function(XLProduct) ontap;
  const PrductItem({super.key, required this.product, required this.ontap, required this.selisih});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(product),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        padding: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                  margin: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                  child: Text(product.productName,
                      style: const TextStyle(fontWeight: FontWeight.bold))),
            ),
            Row(
              children: [
                Text(
                  formatAngka(product.price+ selisih),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
                const Icon(Icons.chevron_right)
              ],
            )
          ],
        ),
      ),
    );
  }
}
