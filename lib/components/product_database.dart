import 'dart:io';
import 'package:farm_2_home/screens/my_cart_screen/my_cart_data_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ProductDatabaseHelper {
  Database? productDatabase;

  static Future<Database> getDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'product_database.db');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Products('
            'productId INTEGER PRIMARY KEY,'
            'productName TEXT,'
            'farmName TEXT,'
            'productQuantity TEXT,'
            'productPrice TEXT,'
            'productOfferPrice TEXT,'
            'productCount INTEGER'
            ')');
      },
    );
  }

  static Future<int> addProduct(CartDataModel product) async {
    final db = await getDatabase();
    return await db.insert("Products", product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateProduct(CartDataModel product) async {
    final db = await getDatabase();
    return await db.update(
      "Products",
      product.toJson(),
      where: 'productId =?',
      whereArgs: [product.productId],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteProduct(CartDataModel product) async {
    final db = await getDatabase();
    return await db.delete(
      "Products",
      where: 'productId = ?',
      whereArgs: [product.productId],
    );
  }

  static Future<List<CartDataModel>?> getAllProducts() async {
    final db = await getDatabase();

    final List<Map<String, dynamic>> maps = await db.query("Products");

    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length, (index) => CartDataModel.fromJson(maps[index]));
  }
}
