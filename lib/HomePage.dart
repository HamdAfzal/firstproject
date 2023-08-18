import 'package:first_project/utility/MyRoutes.dart';
import 'package:first_project/utility/Products.dart';
import 'package:first_project/widgets/FullView.dart';
import 'package:first_project/widgets/Drawer.dart';
import 'package:first_project/widgets/lowerNavigation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  moveToFullView(BuildContext context) async {
    await Navigator.pushNamed(context, MyRoutes.fullView);
    setState(() {});
  }

  void getData() async {
    var response = await Dio().get('https://fakestoreapi.com/products');
    ProductModel.product = List.from(response.data)
        .map<Products>((products) => Products.fromJson(products))
        .toList();
    setState(() {});
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meri Apni App"),
        ),
        body: (ProductModel.product.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 4.5),

                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: Image.network(
                        ProductModel.product[index].image.toString(),
                        cacheWidth: 80,
                        cacheHeight: 80,
                      ),
                      title: Text(
                        ProductModel.product[index].title.toString(),
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        ProductModel.product[index].category.toString(),
                        textAlign: TextAlign.left,
                      ),
                      trailing: Text(
                          "\$${ProductModel.product[index].price.toString()}",
                          textAlign: TextAlign.center),
                      onTap: () => _sendDataToFullView(context, ProductModel.product[index]),

                    ),
                  );

                  },
                itemCount: ProductModel.product.length,
        )
            : const Center(
                child: CircularProgressIndicator(),
              ),
        drawer: drawer(),
        bottomNavigationBar: lowerNavigation(),
      ),
    );
  }

  void _sendDataToFullView(BuildContext context, Products product) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FullView(product: product,),
        ));
  }
}
