import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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

          ElevatedButton(onPressed: (){}, child: const Text('Save')),
          ElevatedButton(onPressed: (){

            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const ProductListScreen();
            }));
          }, child: const Text('View All')),

        ],),
      ),
    );
  }
}
