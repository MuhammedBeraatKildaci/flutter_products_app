import 'package:flutter/material.dart';
import 'package:products_app/data/entity/products.dart';
import 'package:products_app/ui/views/product_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<Product>> getProducts() async {
    var productList = <Product>[];
    productList.add(Product(id: 1, name: 'Macbook Pro', price: 100, description: 'Description 1', image: 'bilgisayar.png'));
    productList.add(Product(id: 2, name: 'Rayban Club Master', price: 200, description: 'Description 2', image: 'gozluk.png'));
    productList.add(Product(id: 3, name: 'Sony ZX-110', price: 300, description: 'Description 3', image: 'kulaklik.png'));
    productList.add(Product(id: 4, name: 'Gio Armani', price: 400, description: 'Description 4', image: 'parfum.png'));
    productList.add(Product(id: 5, name: 'Casio X Series', price: 500, description: 'Description 5', image: 'saat.png'));
    productList.add(Product(id: 6, name: 'Dyson v8', price: 500, description: 'Description 5', image: 'supurge.png'));
    productList.add(Product(id: 7, name: 'Iphone 13', price: 500, description: 'Description 5', image: 'telefon.png'));
    return productList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürünler'),
      ),
      body: FutureBuilder(future: getProducts(), builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/images/${snapshot.data![index].image}'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data![index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(snapshot.data![index].price.toString() + ' ₺', style: const TextStyle(fontSize: 20, color: Colors.blue),),
                        ElevatedButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: snapshot.data![index])));
                        }, child: const Text('Sepete Ekle'))
                      ],
                    ),
                  ],
                ),
              );
            }
          );
        }
        return const Center(child: CircularProgressIndicator());
      })
    );
  }
}