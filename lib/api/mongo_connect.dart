import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoConnect {
  static connect() async {
    var db = await Db.create(dotenv.env['MONGO_URL']!);
    Logger().i('Initiating connection to MongoDB...');
    await db.open();
    if (db.isConnected) {
      Logger().i('Connected to MongoDB');
    } else {
      Logger().e('Failed to connect to MongoDB');
    }
  }
}
