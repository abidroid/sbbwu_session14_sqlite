import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sbbwu_session14_sqlite/db/database_helper.dart';
import 'package:sbbwu_session14_sqlite/models/product.dart';
import 'package:sbbwu_session14_sqlite/screens/update_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('Product List'),
      ),

      body: FutureBuilder<List<Product>>(

        future: DatabaseHelper.instance.getAllProducts(),
        builder: (context, snapshot){
          if( snapshot.hasData){

            List<Product> products = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){

                    Product product = products[index];

                return Card(
                    color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        Row(children: [
                          const SizedBox(width: 100, child: Text('ID'),),
                          Text(product.id!.toString()),
                        ],),
                        Row(children: [
                          const SizedBox(width: 100, child: Text('Title'),),
                          Text(product.title),
                        ],),
                        Row(children: [
                          const SizedBox(width: 100, child: Text('Brand'),),
                          Text(product.brand),
                        ],),

                        Row(children: [
                          const SizedBox(width: 100, child: Text('Price'),),
                          Text(product.price),
                        ],),

                        Row(children: [
                          const SizedBox(width: 100, child: Text('Color'),),
                          Text(product.color),
                        ],),
                        Row(children: [
                          const SizedBox(width: 100, child: Text('Size'),),
                          Text(product.size),
                        ],),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                          IconButton(onPressed: (){
                            // how to show an alert dialog

                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text('Are you sure to delete ?'),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  }, child: const Text('No')),
                                  TextButton(onPressed: () async {
                                    Navigator.of(context).pop();

                                    int result = await DatabaseHelper.instance.deleteProduct(product.id!);

                                    if( result > 0 ){
                                      Fluttertoast.showToast(msg: 'Record Deleted');
                                      setState(() {

                                      });
                                    }else{
                                      Fluttertoast.showToast(msg: 'Failed');

                                    }


                                  }, child: const Text('Yes')),

                                ],
                              );
                            });

                          }, icon:const Icon(Icons.delete, color: Colors.red,)),
                          IconButton(onPressed: () async {

                            bool updated = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return UpdateProductScreen(product: product);
                            }));

                            if( updated){
                              setState(() {

                              });
                            }

                          }, icon:const Icon(Icons.edit, color: Colors.blue,)),

                        ],)
                      ],
                    ),
                  ),
                );
              }),
            );

          }else{
            return const Center(child: CircularProgressIndicator(),);
          }

        },
      ),
    );
  }
}
