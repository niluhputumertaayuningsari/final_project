import 'package:flutter/material.dart';
import 'package:application/ui/inputpenjualan.dart';
import 'package:application/models/penjualan.dart';
import 'package:application/helper/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Penjualan> penjualanList;
  @override
  Widget build(BuildContext context) {
    if (penjualanList == null) {
      penjualanList = <Penjualan>[];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        title: Text('Scarlett Official'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[500],
          child: Icon(Icons.add),
          tooltip: 'Input Data',
          onPressed: () async {
            var penjualan = await navigateToEntryForm(context, null);
            if (penjualan != null) addPenjualan(penjualan);
          }),
    );
  }

  Future<Penjualan> navigateToEntryForm(
      BuildContext context, Penjualan penjualan) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
          return InputPenjualan(penjualan);
        }));
    return result;
  }

  ListView createListView() {
    // ignore: deprecated_member_use
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.attach_money),
            ),
            title: Text(
              this.penjualanList[index].name,
              style: textStyle,
            ),
            subtitle: Row(
              children: <Widget>[
                Text(this.penjualanList[index].tanggal),
                Text("  | Rp.  "+this.penjualanList[index].jumlah,style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deletePenjualan(penjualanList[index]);
              },
            ),
            onTap: () async {
              var penjualan =
              await navigateToEntryForm(context, this.penjualanList[index]);
              if (penjualan != null) editPenjualan(penjualan);
            },
          ),
        );
      },
    );
  }

  void addPenjualan(Penjualan object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editPenjualan(Penjualan object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
      print("ini editPenjualan RESULT $result");
    }
  }

  void deletePenjualan(Penjualan object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((datatabase) {
      Future<List<Penjualan>> penjualanListFuture = dbHelper.getPenjualanList();
      penjualanListFuture.then((penjualanList) {
        setState(() {
          this.penjualanList = penjualanList;
          this.count = penjualanList.length;
        });
      });
    });
  }
}