import 'package:application/detail_produk.dart';
import 'package:application/productlist.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        title:
        // menyusun tulisan secara horizontal dan di tengah
        Row(children: <Widget>[
          Text('Scarlett Official'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              print('clik notifikasi');
            },
          ),
        ],
      ),
      drawer: new Drawer(
        //menggunakan listview karena di dalam drawer terdapat banyak menu
        child: new ListView(children: <Widget>[
          new UserAccountsDrawerHeader( //UserAccountsDrawerHeader sudah ada di fungsi widget
              accountName: new Text("Ni Luh Putu Merta Ayuning Sari"),
              accountEmail: new Text("merta.ayuning@undiksha.ac.id"),
              currentAccountPicture: new GestureDetector(
                onTap: () {},//dapat melakukan apa
                child: new CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/appimages/foto.jpg'),
                ),
              ),
              decoration: BoxDecoration( //untuk background foto di drawer
                color: Colors.orange[500]
              )),
          new ListTile( // listtile merupakan anak dari listview yang berupa menu
            title: new Text('Notifications'),
            trailing: new Icon(Icons.notifications_none),
          ),
          new ListTile(
            title: new Text('Wishlist'),
            trailing: new Icon(Icons.bookmark_border),
          ),
          new ListTile(
            title: new Text('Setting'),
            trailing: new Icon(Icons.settings),
          ),
          new ListTile(
            title: new Text('About '),
            trailing: new Icon(Icons.info),
          ),
        ]),
      ),//enddrawer
//seluruh body dibungkus colum
      body: new ListView(
        children: <Widget>[
//setiap bagian pada body dipisahkan container yang berisikan ringkasan aplikasi
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: ksecondaryColor.withOpacity(0.32),
        ),
      ),
//untuk membuat tampilan secara horizontal digunakan row
            child: Row(
              children: [
                Expanded( // dihabiskan agar tidak terlalu kekiri dan terlalu kekanan
                  child: TextField(
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: "Search Here",
                    hintStyle: TextStyle(color: ksecondaryColor),
                    ), 
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/appimages/logo.jpg"),
//setiap bagian pada body dipisahkan container
      Container(
      height: 23,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'BodyCare',
                style: TextStyle(
              fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 10,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          Text(
            'SkinCare',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'HairCare',
           style: TextStyle (
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Other',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),

    Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Product',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
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

          Container(
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Offers & Discounts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Image.asset("assets/appimages/promo.jpeg",width: 400, height: 200,),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
