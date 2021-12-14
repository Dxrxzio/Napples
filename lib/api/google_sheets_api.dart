// ignore_for_file: avoid_print, prefer_const_declarations

import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  //create credentials
  static const _credentials = r'''
  {
    "type": "service_account",
    "project_id": "flutter-budget",
    "private_key_id": "ba6e06e225ccf08991aeaadaec3ee86d701d743a",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC/PY0PBp6iavZD\ndwaz7mw+tRzag1Rgn0pjzkbO7kZVzdZQQ9kgtIdhHsmUtBUaNaSlrobUs02OTk9T\nn9ouLymHqa9nQB3i0qJusNkwyQ8NdJ3Sq8+miFqFT83sake61ZwvsR2ujnWliyyy\nVIaza+ECypeLXnfuYz44ywKtW0C2m7EstT4VWDPIUxgpqgkx84mAQUmu7CU1XXe3\ntAy+38U2mMvXlUebDywFDMQdvQ4xcVn2H6JOvP8jI/k4zXexnPO8X8oqNTI9TfpN\nqMb9Rj2LA0i4F3jc1O8hupgc3ciuRo8FecILK0WfNb7i5H74WHaEel+fsxcfXEza\ns9ptD+evAgMBAAECggEADjSAOdGADwhq6m/463yWRcImNoTyy4qJeAhmchB44P69\nIJEpm6hNNgWXa5hEyQGbDUN9eGcpJ5zhf5CsICoYp58PDFhS3/pNXnN8bodAuvsi\njfd9IR2Xu7dF0H3EfjhHtbMuRT0HuBgyZbyplMI6oH5z60JFHkv43zcVJ9NTZzzg\neLt1zG+hvxRYKtj63BpHnCuJiC5ayPHWcW3onmv+w5iSQL38cPNd9cC0BM+khfc7\n2YK57Ko7FQEYF1um5q8EhS91s/I8eEhB0X3L0XlXiGdUqaQypyzZR0daYdwxNNkz\n7cWOCsw6HbgxUNdOCJQXrmpdzbqA20orMhPeC+uDQQKBgQDfzgK+8rLesL/LgtcF\n1EobRJ3QrByKxvc8flX9VK5Ty2vGrIW9uO26E7Maip2s+nLS+ILLfPD3B7sMRpdj\naXUM+CeEmtbRbg6SDguNhboMZR3LzBl8LSVTp9nS9qVbQ53RFAr9kedbYSU98n8r\nGy5IFGJnbOHqWGr7Kag+b+1g5wKBgQDawE4GZeI4V2mwZtEHufJwNSmWr4RZ475m\nzkdx18FDKZSgjNzH/lP8t5LJDE3MMzh9RnhEchP8XhUlt78cXOFDu2LSUVFQetuW\n2uAMR4are1wSOLnRLRUvIy3h52ZVYbKWc1pffE0fXAYJZ2xUFJYUON+VU9OQLhEp\ngErrTZ5B+QKBgFSXZlxMGaWoQuYmLyXJ5rTFy6yq0SL3L03TJqdZEYcklTkDzo02\nT8yMU58Nk6llBG+PdMh7Eg0dA+sQ53mwy4g6Z51sdRO1uJYl7uHwELFMquVz4JIZ\n8kjbYa6mgTuspAL5w2myczML1erDNKPTYzvlUIhtFDribpU+WpQ29A8zAoGAKsSA\nPLX8pYFJk4h2g6kyIgfyypgkKyLgnd7kjvhcu5HMkhsYKy2pI/aMByyVpT+6Ypu9\ndbxL9gI65jXnclciX4iqSG5HlJGAjxzZwuzVAn/Kv3FBuwiyZJXfKZSBKF5CeTGy\nUIrP1Tq7n2kN/95KfUelRt+ttDmdd1yyyRBSyZkCgYEAxBISqR8iDF2GUvFpssjm\nYZn3gy8kxr6aSdFp+Yhmzk71tKhd6y2I3c2PlEQw3VfQqY7pOWE7Oq7arUWIJpww\nDfXse8qyMIoADPk/bGSwZidXpb+JazAFWqXhrNraUbfnIuqyDdYx/ecuoDL4o8uj\nmrMXgJmqNMJVuB4b8QStXAA=\n-----END PRIVATE KEY-----\n",
    "client_email": "flutter-gsheets@flutter-budget.iam.gserviceaccount.com",
    "client_id": "115831955506614609229",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40flutter-budget.iam.gserviceaccount.com"
  }
  ''';

  // set up & connect to the spreadsheet
  static final _spreadsheetId = '1QEckGj8QdiPKY8uPp350RqYkFP2mQBRrEGlbM001u64';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  // some variables to keep track of..
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initialise the spreadsheet!
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Sheet1');
    countRows();
  }

  Future<bool> deletecurrentTransactions(int index) {
    /// We add one to the index so that we can:
    /// 1. Start at index 1
    /// 2. Skip the first row
    return _worksheet!.deleteRow(index + 2);
  }

  // count the number of notes
  static Future countRows() async {
    while ((await _worksheet?.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // now we know how many notes to load, now let's load them!
    loadTransactions();
  }

  // load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }

  // insert a new transaction
  static Future insert(String name, String amount, bool _isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
  }

  // CALCULATE THE TOTAL INCOME!
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  // CALCULATE THE TOTAL EXPENSE!
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}
