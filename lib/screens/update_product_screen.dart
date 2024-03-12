

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});

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

          ElevatedButton(onPressed: (){}, child: const Text('Update')),

        ],),
      ),
    );

  }
}
