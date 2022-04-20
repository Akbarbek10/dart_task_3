import 'dart:io';

import 'Abonent.dart';

void main(List<String> arguments) {
  List<Abonent> abonentList = [];
  int id = 0;
  while (true) {

    print("[1] - Add a new client");
    print("[2] - List of all abonents");
    print("[0] - Exit");
    stdout.write("num: ");
    int n = int.parse(stdin.readLineSync()!);
    switch (n) {
      case 1:
        {
          print("--- Add a new abonent page ---");

          stdout.write("Enter surname: ");
          String surname = stdin.readLineSync()!;
          stdout.write("Enter name: ");
          String name = stdin.readLineSync()!;
          stdout.write("Enter middle name: ");
          String middleName = stdin.readLineSync()!;
          stdout.write("Enter address: ");
          String address = stdin.readLineSync()!;
          stdout.write("Enter credit: ");
          String credit = stdin.readLineSync()!;
          stdout.write("Enter card number: ");
          int cardNumber = int.parse(stdin.readLineSync()!);
          stdout.write("Enter debit: ");
          int debit = int.parse(stdin.readLineSync()!);
          stdout.write("Enter city: ");
          String city = stdin.readLineSync()!;
          stdout.write("Inside calls: ");
          int insideCalls = int.parse(stdin.readLineSync()!);
          stdout.write("Outside calls: ");
          int outsideCalls = int.parse(stdin.readLineSync()!);

          id++;
          Abonent abonent = Abonent(id, surname, name, middleName, address,
              credit, cardNumber, debit, city, insideCalls, outsideCalls);
          abonentList.add(abonent);
          break;
        }
      case 2:
        {
          if (abonentList.isEmpty) {
            print("List is empty");
          } else {
            if (abonentList.isNotEmpty) {
              List<String> aplhabeticSort = [];
              abonentList.forEach((element) {
                print("----------");
                aplhabeticSort.add(
                    "${element.surname} ${element.name} ${element.middleName}");
              });

              int counter = 1;
              print("Abonentlar ro’yxati alfavit tartibida:");
              aplhabeticSort.forEach((element) {
                print("$counter) $element");
                counter++;
              });
              print("**********");
              counter = 1;
              print("Shaharlararo suhbat vaqti shahar bo’yicha suhbat vaqtidan ko’p bo’lgan abonentlar ro’yxati:");
              abonentList.forEach((element) {
                if (element.outsideCalls > element.insideCalls) {
                  print(
                      "$counter )${element.surname} ${element.name} ${element.middleName}");
                  counter++;
                }
              });
            } else {}
          }
          break;
        }
      case 3:
        {
          print("Exited!");
          break;
        }
      default:
        {
          print("^^^^^");
        }
    }
  }
}
