import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class BarangList extends StatefulWidget {
  const BarangList({Key? key}) : super(key: key);

  @override
  State<BarangList> createState() => _BarangListState();
}

class _BarangListState extends State<BarangList> {
  List barangList = [
    {'name': "Kemeja", 'price': "Rp. 100.000", 'productionDate': "20/10/2020"},
    {'name': "Celana", 'price': "Rp. 200.000", 'productionDate': "20/10/2020"},
    {'name': "Kaos", 'price': "Rp. 400.000", 'productionDate': "20/10/2020"},
    {'name': "Sepatu", 'price': "Rp. 300.000", 'productionDate': "20/10/2020"},
    {'name': "Tas", 'price': "Rp. 500.000", 'productionDate': "20/10/2020"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search),
        title: const Text('Flutter Belajar 1'),
        actions: const <Widget>[
          Icon(Icons.add),
          Icon(Icons.list),
        ],
      ),
      body: ListView.builder(
        itemCount: barangList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              height: 72,
              padding: const EdgeInsets.all(8),
              color: Colors.grey[100],
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://picsum.photos/100/100')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(barangList[index]['name']),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(barangList[index]['price']),
                        ),
                      ],
                    )
                  ]),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditScreen(barangList[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            barangList.add({
              'name': "Barang Baru",
              'price': "Rp. 100.000",
              'productionDate': "20/10/2020"
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  const EditScreen(this.barang, {Key? key}) : super(key: key);
  final dynamic barang;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Screen'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Center(
              child: Column(children: [
        Text(widget.barang['name']),
        Text(widget.barang['price']),
        Text(widget.barang['productionDate'])
      ]))),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: BarangList(),
    );
  }
}
