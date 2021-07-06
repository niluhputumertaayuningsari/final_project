import 'package:flutter/material.dart';
import './dashboard.dart' as dashboard;
import './productlist.dart' as produklist;
import 'ui/home.dart' as home;

void main() {
  runApp(new MaterialApp(
    title: "tab Bar",
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
//ketika menggunakan controller panggil juga SingleTickerProviderStateMixin
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller; //nama variabel
  @override
  void initState() { //inisiasi menggunakan controller
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }
//menggunakan dispose untuk berpindah halaman,ketika mengklik yang aktif maka yg lain akan di close
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new TabBarView(
          controller: controller, //panggil variabel
          children: <Widget>[ // menggunakan children karena tabbarview dapat menggunakan banyak widget
            new dashboard.Dashboard(),
            new produklist.ProdukList(),
            new home.Home(),
          ],
        ),
        bottomNavigationBar: new Material( //navigatornya berada dibagian bawah
          color: Colors.orange[500],
          child: new TabBar(
            controller: controller,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.home)),//tab icon ini mengontrol dashboard
              new Tab(icon: new Icon(Icons.list)), //tab icon ini mengontrol produklist
              new Tab(icon: new Icon(Icons.add_chart)),
            ],
          ),
        )
    );
  }
}