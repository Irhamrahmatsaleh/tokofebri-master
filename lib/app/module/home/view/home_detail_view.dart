import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tokofebri/models/models.dart';

class ProductDetailView extends StatefulWidget {
  final Product productId;
  const ProductDetailView({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Image.network(
                widget.productId.cover,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productId.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: 'Rp.')
                        .format(widget.productId.price),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.indigo),
                  ),
                  const Divider(thickness: 1,),
                  Text(widget.productId.desc),
                ],
              ),
            ),
          ],
        )
        // Center(
        //   child: Text(
        //       "INI ADALAG PAGE PRODUK ${widget.productId.name} - (${widget.productId.desc})"),
        // ),
        );
  }
}
