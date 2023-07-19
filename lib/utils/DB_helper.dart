import 'dart:io';

import 'package:income_expense/Screen/Model/income_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBhelper {
  Database? database;
  final String? dbpath = 'datatable.db';
  final String? db_name = 'incomeExpanse';

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Database> initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String? path = join(dir.path, dbpath);

    String query =
        "CREATE TABLE $db_name (id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT,name TEXT,amount TEXT,date TEXT,status TEXT)";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute(query);
      },
    );
  }

  Future<Future<int>> insertDb(IncomeExpenseModel model) async {
    database = await checkDB();
    return database!.insert(db_name!, {
      'name': model.name,
      'category': model.category,
      'amount': model.amount,
      'date': model.date,
      'status':model.status,
    });
  }

  

  Future<List<Map>> readDB()
  async {
    database = await checkDB();
    String query = 'SELECT * FROM $db_name';
    List<Map> list = await database!.rawQuery(query);

    return list;
  }

  Future<List<Map>> filtterData({cat, name, date1, date2})
  async {
    String query = '';
    database = await checkDB();
    if(cat!=null && name!=null && date1!=null && date2!=null)
      {
         query="SELECT * FROM $db_name WHERE category = '$cat' AND name = '$name' AND date BETWEEN '$date1' AND '$date2'";
      }
    // else if(cat!=null && name!=null)
    //   {
    //      query="SELECT * FROM $db_name WHERE category = '$cat' AND name = '$name'";
    //   }
    // else if(name!=null && date1!=null && date2!=null)
    //   {
    //     query="SELECT * FROM $db_name WHERE name = '$name' AND date BETWEEN '$date1' AND '$date2'";
    //   }
    // else if(cat!=null && date1!=null && date2!=null)
    // {
    //   query="SELECT * FROM $db_name WHERE cat = '$cat' AND date BETWEEN '$date1' AND '$date2'";
    // }
    // else if(cat!=null)
    //   {
    //     query="SELECT * FROM $db_name WHERE cat = '$cat'";
    //   }
    // else if( name!=null)
    //   {
    //     query="SELECT * FROM $db_name WHERE name = '$name'";
    //   }
    // else if( date1!=null && date2!=null)
    //   {
    //     query="SELECT * FROM $db_name WHERE cat = '$cat' AND date BETWEEN '$date1' AND '$date2'";
    //   }
    List<Map> l1 = await database!.rawQuery(query);
    print(l1);
    return l1;
  }


  Future<Future<int>> deleteDb(int id)
  async {
    database = await checkDB();
    return database!.delete('$db_name',where:"id=?" ,whereArgs:[id]);
  }

  Future<Future<int>> updateDb(IncomeExpenseModel model,int id)
  async {
    database = await checkDB();
    return database!.update('$db_name', {
      'name': model.name,
      'category': model.category,
      'amount': model.amount,
      'date': model.date,
      'status':model.status,
    }, where: "id=?",whereArgs:[id] );
  }

}
