import 'dart:io';
import 'dart:typed_data';
import 'package:portfolio/core/utility/trial_utility.dart';
import 'package:portfolio/core/utility/utility.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:portfolio/core/utility/logger_utility.dart';

const String _dbPath = "assets/database";
const String _duaDbFileName = "dua_main.db";
const String _duaDbPath = "$_dbPath/$_duaDbFileName";

Future<void> loadEnv() async {
  final bool? result = await catchAndReturnFuture<bool>(() async {
    await dotenv.load(fileName: '.env');
    return true;
  });

  if (result != true) {
    logErrorStatic('Error loading .env file', 'DatabaseLoader');
    throw Exception('Error loading .env file');
  }
}

/// Drift ডাটাবেসের জন্য লেজি লোডার প্রদান করে
LazyDatabase loadDatabase() => LazyDatabase(() => _databaseOpener);

/// ডাটাবেস ফাইল আছে কিনা চেক করে
Future<bool> isDatabaseFileFound() async {
  final bool? fileFound = await catchAndReturnFuture(() async {
    final File file = await getDatabaseFile(fileName: _duaDbFileName);
    return file.exists();
  });
  return fileFound ?? false;
}

/// ডাটাবেস ফাইল পাথ জেনারেট করে
Future<String> getDatabaseFilePath(String fileName) async {
  final String directoryPath = await getApplicationDirectoryPath();
  return p.join(directoryPath, fileName);
}

/// ডাটাবেস ফাইল অবজেক্ট জেনারেট করে
Future<File> getDatabaseFile({required String fileName}) async {
  final String dbPath = await getDatabaseFilePath(fileName);
  final File file = File(dbPath);
  return file;
}

/// অ্যাসেট থেকে ইন্টারনাল স্টোরেজে ডাটাবেস ফাইল কপি করে
Future<void> moveDatabaseFromAssetToInternal({
  required String assetPath,
  required File file,
}) async {
  await catchFutureOrVoid(() async {
    final bool databaseExists = await file.exists();
    if (databaseExists) return;

    final ByteData blob = await rootBundle.load(assetPath);
    final ByteBuffer buffer = blob.buffer;
    final Uint8List dbAsBytes = buffer.asUint8List(
      blob.offsetInBytes,
      blob.lengthInBytes,
    );

    await file.parent.create(recursive: true);
    await file.create(recursive: true);

    await writeFileAsBytesInIsolate(file, dbAsBytes);
    logDebugStatic(
      'Database copied from assets to: ${file.path}',
      'DatabaseLoader',
    );
  });
}

/// Database Executor creeate
Future<QueryExecutor> get _databaseOpener async {
  final File file = await getDatabaseFile(fileName: _duaDbFileName);
  await moveDatabaseFromAssetToInternal(file: file, assetPath: _duaDbPath);
  return NativeDatabase.createInBackground(file);
}
