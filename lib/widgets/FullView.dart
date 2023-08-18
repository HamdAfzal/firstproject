import 'package:first_project/widgets/lowerNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utility/Products.dart';

class FullView extends StatefulWidget {
  FullView({Key? key, this.product}) : super(key: key);
  Products? product;

  @override
  State<FullView> createState() => _FullView();
}

class _FullView extends State<FullView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.product?.title ?? ""),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(
                width: 1000,
                height: 300,
                child: Image.network(widget.product?.image ?? "")),
            Card(child: Text(widget.product?.description ?? "")),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                "\$ ${widget.product?.price.toString() ?? ""}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Text("Rating: ${widget.product?.rating?.rate ?? 0}"),
                SizedBox(
                  width: 15,
                ),
                RatingBarIndicator(
                  rating: widget.product?.rating?.rate?.toDouble() ?? 0,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 17.0,
                ),
                const SizedBox(
                  width: 120,
                ),
                       Text("Reviews:   ${widget.product?.rating?.count ?? 0}",style: TextStyle(
                         fontWeight: FontWeight.bold
                       ),)
              ],
            ),
          ]),
        ),
        bottomNavigationBar: lowerNavigation(),
      ),
    );
  }
}
