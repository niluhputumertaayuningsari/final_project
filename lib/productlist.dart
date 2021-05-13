import 'package:flutter/material.dart';
import './detail_produk.dart';

// menggunakan gesture detector dan navigator
class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar menu")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: <Widget>[
          new GestureDetector( //menggunakan gesture detector agar dapat di klik
            onTap: () {
              Navigator.of(context).push( //menggunakan push agar dapat back ke halaman sebelumnya
                //navigator digunakan untuk menanggil sebuah fungsi atau class
                new MaterialPageRoute(
                    builder: (BuildContext context) => DetailProduk( //builder memanggil class yang ada di detail produk
                      //kemudian mengirim parameter, untuk menampilkan identitas
                      name: "Freshy (Fragrance Brightening Body Lotion)",
                      description: "Body lotion dengan aroma Freshy",
                      price: 75000,
                      image: "lotion_1.jpg",
                      star: 5,
                    )),
              );
            },
            //memanggil class local produkbox
            child: ProductBox(
              //berisikan parameter yang dibutuhkan produkbox
              nama: "Freshy (Fragrance Brightening Body Lotion",
              deskripsi: "Body lotion dengan aroma Freshy",
              harga: 75000,
              image: "lotion_1.jpg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                      name: "Fantasia (Fragrance Brightening Body Lotion)",
                      description: "Body lotion dengan aroma Fantasia",
                      price: 75000,
                      image: "lotion 2.jpg",
                      star: 5,
                    )),
              );
            },
            child: ProductBox(
              nama: "Fantasia (Fragrance Brightening Body Lotion)",
              deskripsi: "Body lotion dengan aroma Fantasia",
              harga: 75000,
              image: "lotion 2.jpg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                      name: "Romansa (Fragrance Brightening Body Lotion)",
                      description: "Body lotion dengan aroma Romansa",
                      price: 75000,
                      image: "lotion 3.jpg",
                      star: 5,
                    )),
              );
            },
            child: ProductBox(
              nama: "Romansa (Fragrance Brightening Body Lotion)",
              deskripsi: "Body lotion dengan aroma Romansa",
              harga: 75000,
              image: "lotion 3.jpg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                      name: "Cucumber (Brightening Shower Scrub)",
                      description: "Shower scrub dengan aroma Cucumber",
                      price: 75000,
                      image: "shower 1.jpg",
                      star: 5,
                    )),
              );
            },
            child: ProductBox(
              nama: "Cucumber (Brightening Shower Scrub)",
              deskripsi: "Shower scrub dengan aroma Cucumber",
              harga: 75000,
              image: "shower 1.jpg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                      name: "Pomegrante (Brightening Shower Scrub)",
                      description: "Shower scrub dengan aroma Pomegrante",
                      price: 75000,
                      image: "shower 2.jpg",
                      star: 5,
                    )),
              );
            },
            child: ProductBox(
              nama: "Pomegrante (Brightening Shower Scrub)",
              deskripsi: "Shower scrub dengan aroma Pomegrante",
              harga: 75000,
              image: "shower 2.jpg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                      name: "Mango (Brightening Shower Scrub)",
                      description: "Shower scrub dengan aroma Mango",
                      price: 75000,
                      image: "shower 3.jpg",
                      star: 5,
                    )),
              );
            },
            child: ProductBox(
              nama: "Mango (Brightening Shower Scrub)",
              deskripsi: "Shower scrub dengan aroma Mango",
              harga: 75000,
              image: "shower 3.jpg",
              star: 5,
            ),
          )
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      //penangkapan parameter yang diterima dari myhomepage
          {Key key, this.nama, this.deskripsi, this.harga, this.image, this.star})
      : super(key: key);
  final String nama;
  final String deskripsi;
  final int harga;
  final String image;
  final int star;
  final children = <Widget>[];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.yellow,
      ));
    }// for merupakan syntax yg digunakan untuk menampilkan berapa jumlah bintang

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset( // menggunakan image lokal
            "assets/appimages/" + image,
            width: 150,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text(
                    this.nama, //untuk nama
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(this.deskripsi), //deskripsi produk
                  Text(
                    "Harga :" + this.harga.toString(), // harga produk
                    style: TextStyle(color: Colors.orange),
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: children,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
