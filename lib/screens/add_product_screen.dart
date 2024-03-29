import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:sbbwu_session14_sqlite/db/database_helper.dart';
import 'package:sbbwu_session14_sqlite/models/product.dart';
import 'package:sbbwu_session14_sqlite/screens/product_list_screen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var titleC = TextEditingController();
  var brandC = TextEditingController();
  var priceC = TextEditingController();
  var colorC = TextEditingController();
  var sizeC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: titleC,
              decoration: const InputDecoration(
                hintText: 'Product title',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(16),
            TextField(
              controller: brandC,
              decoration: const InputDecoration(
                hintText: 'Product Brand',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(16),
            TextField(
              controller: priceC,
              decoration: const InputDecoration(
                hintText: 'Product Price',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(16),
            TextField(
              controller: colorC,
              decoration: const InputDecoration(
                hintText: 'Product Color',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(16),
            TextField(
              controller: sizeC,
              decoration: const InputDecoration(
                hintText: 'Product Size',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(16),
            ElevatedButton(
                onPressed: () async {
                  String title = titleC.text.trim();

                  if (title.isEmpty) {
                    Fluttertoast.showToast(msg: 'Please provide title');
                    return;
                  }

                  String brand = brandC.text.trim();
                  String price = priceC.text.trim();
                  String color = colorC.text.trim();
                  String size = sizeC.text.trim();

                  Product product = Product(
                    id: null,
                    title: title,
                    brand: brand,
                    price: price,
                    color: color,
                    size: size,
                  );

                  // Pass this object to database and save inside table

                 int result = await DatabaseHelper.instance.saveProduct(product);

                 if( result > 0 ){
                   Fluttertoast.showToast(msg: 'Record Saved');
                 }else{
                   Fluttertoast.showToast(msg: 'Failed');
                 }

                },
                child: const Text('Save')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ProductListScreen();
                  }));
                },
                child: const Text('View All')),
          ],
        ),
      ),
    );
  }
}
