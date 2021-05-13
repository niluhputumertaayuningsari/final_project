import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        // menyusun tulisan secara horizontal dan di tengah
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Dashboard'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              print('clik start');
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
                image: DecorationImage(
                    image: AssetImage('assets/appimages/logo 1.png'),
                    fit: BoxFit.cover),
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
          Image.asset("assets/appimages/logo.jpg"),
//setiap bagian pada body dipisahkan container yang berisikan ringkasan aplikasi
          Container(
            color: Colors.yellow[300],
            padding: const EdgeInsets.all(10),
//untuk membuat tampilan secara horizontal digunakan row
            child: Row(
              children: [
                Expanded( // dihabiskan agar tidak terlalu kekiri dan terlalu kekanan
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rp 75.000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'Under 75.000',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.local_offer,
                  color: Colors.red[500],
                ),
                Text('Diskon 10%'),
              ],
            ),
          ),
//setiap bagian pada body dipisahkan container
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
//untuk membuat tampilan secara horizontal maka digunakan row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//untuk membuat tampilan secara vertikal maka digunakan colum
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.grid_on, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Semua Menu",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.accessibility, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "BodyCare",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.mood_outlined, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "FacialCare",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.format_list_bulleted, color: Colors.blue),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Lain-lain",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.yellow, Colors.lightBlueAccent],
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
                        'Banyak Varian Baru',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        'BodyCare dan FacialCare ',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
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
