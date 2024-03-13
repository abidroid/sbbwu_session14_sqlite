

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:sbbwu_session14_sqlite/db/database_helper.dart';
import 'package:sbbwu_session14_sqlite/models/product.dart';

class UpdateProductScreen extends StatefulWidget {
  final Product product;

  const UpdateProductScreen({super.key, required this.product});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {

  var titleC = TextEditingController();
  var brandC = TextEditingController();
  var priceC = TextEditingController();
  var colorC = TextEditingController();
  var sizeC = TextEditingController();

  @override
  void initState() {
    titleC.text = widget.product.title;
    brandC.text = widget.product.brand;
    priceC.text = widget.product.price;
    colorC.text = widget.product.color;
    sizeC.text = widget.product.size;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [

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
            decoration:const InputDecoration(
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

          ElevatedButton(onPressed: () async {
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
              id: widget.product.id!,
              title: title,
              brand: brand,
              price: price,
              color: color,
              size: size,
            );

            int result = await DatabaseHelper.instance.updateProduct(product);
            if( result > 0 ){
              Fluttertoast.showToast(msg: 'Record Updated');

              Navigator.of(context).pop(true);
            }else{
              Fluttertoast.showToast(msg: 'Failed');
            }

          }, child: const Text('Update')),

        ],),
      ),
    );

  }
}
