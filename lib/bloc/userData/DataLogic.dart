import 'package:bloc/bloc.dart';
import 'package:event/bloc/userData/DataState.dart';
import 'package:sqflite/sqflite.dart';

class UserLogic extends Cubit<UserState>{
  UserLogic(): super(InitUser());
  late Database database;
  List users = [];
  void CreateDataBaseAndTable() async {
     await openDatabase(
      'us.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE user (
            ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            email TEXT,
            password TEXT
          )
        ''');
        print('table created');
      },
      onOpen: (Database db) {
        getData(db).then((value){
          users = value;
          emit(GetUser());
          print('Data is $users');
        });

        print('database open');
      },
    ).then((value) {
      database = value;
      emit(CreateUser());
     });
  }

  insertData({String email = '', String password = ''}) {
    database.transaction((txn) async {
      txn.rawInsert('''
        INSERT INTO user (email, password)
        VALUES (?, ?)
      ''', [email, password]).then((value) {
        print('row inserted $value');
        emit(InsertUser());
        getData(database).then((value) {
          users = value;
          emit(GetUser());
        });
      });
    });
  }

  Future<List> getData(Database db) async {
    return await db.rawQuery('select * from user');
  }

  updateData({int id =0,String email = '', String password = ''}){
    database.rawUpdate('UPDATE user SET email = ?,password =? WHERE id = ?',
        ['$email','$password','$id']
    );
    print('Data is updated');
    emit(UpdateUser());
  }

  deleteData({int id =0}){
    database.rawDelete('DELETE FROM user WHERE id = ?',['$id']);
    print('Data is deleted');
    emit(DeleteUser());
  }
}