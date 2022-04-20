import 'dart:io';

import 'models/Driver.dart';
import 'models/Passenger.dart';

List<Driver> drivers = [];
List<Passenger> passengers = [];

void main(List<String> arguments) {
  print("Welcome to Yandex Taxi!");

  bool temp = true;
  while (temp) {
    print("[1] - Sign in");
    print("[2] - Sign up");
    print("[3] - All orders");
    print("[4] - All drivers");
    print("[5] - Quit");
    int n = int.parse(stdin.readLineSync()!);
    switch (n) {
      case 1:
        {
          openSignInPage();
          break;
        }
      case 2:
        {
          openSignUpPage();
          break;
        }
      case 3:
        {
          for (int i = 0; i < passengers.length; i++) {
            var passenger = passengers[i];
            print("Order num: [$i]");
            print("Passenger: [${passenger.fullName}]");
            print("From: [${passenger.location}]");
            print("To: [${passenger.destination}]");
            print("----------");
          }

          break;
        }
      case 4:
        {
          for (int i = 0; i < drivers.length; i++) {
            var driver = drivers[i];
            print("#$i");
            print("Driver: [${driver.fullName}]");
            print("Experience: [${driver.experience}]");
            print("Rating: [${driver.rating}*]");
            print("----------");
          }
          break;
        }
      case 5:
        {
          print("Exited!");
          break;
        }
    }
  }
}

void openSignInPage() {}

void openSignUpPage() {
  print("---Registration page---");

  stdout.write("Full name: ");
  String fullName = stdin.readLineSync()!;
  stdout.write("Phone number: ");
  String phoneNum = stdin.readLineSync()!;
  stdout.write("Age: ");
  int age = int.parse(stdin.readLineSync()!);
  print("Sign in as -> 1 - Passenger | 2 - Driver { 0 - to exit }");

  bool temp = true;
  while (temp) {
    int n = int.parse(stdin.readLineSync()!);
    switch (n) {
      case 0:
        {
          print("Exited!");
          temp = false;
          break;
        }
      case 1:
        {
          createNewPassenger(fullName, phoneNum, age);
          temp = false;
          break;
        }
      case 2:
        {
          createNewDriver(fullName, phoneNum, age);
          temp = false;
          break;
        }
      default:
        print("1 - Passenger | 2 - Driver { 0 - to exit }");
    }
  }
}

void createNewDriver(String fullName, String phoneNum, int age) {
  stdout.write("Enter your experience: ");
  int experience = int.parse(stdin.readLineSync()!);
  stdout.write("Enter your rating: ");
  int rating = int.parse(stdin.readLineSync()!);
  stdout.write("Are you free and ready to start a trip? <Yes/No>");
  bool isFree = false;
  bool b = true;
  while (b) {
    String n = stdin.readLineSync()!.toLowerCase();
    switch (n) {
      case "yes":
        {
          isFree = true;
          b = false;
          break;
        }
      case "no":
        {
          isFree = false;
          b = false;
          break;
        }
      default:
        print("<Yes/No>");
    }
  }

  var driver = Driver();
  driver.fullName = fullName;
  driver.phoneNumber = phoneNum;
  driver.age = age;
  driver.rating = rating;
  driver.experience = experience;
  driver.isFree = isFree;

  drivers.add(driver);
}

void createNewPassenger(String fullName, String phoneNum, int age) {
  stdout.write("Enter location: ");
  String location = stdin.readLineSync()!;
  stdout.write("Enter destination: ");
  String destination = stdin.readLineSync()!;
  print("New order has been created!");

  var passenger = Passenger();
  passenger.fullName = fullName;
  passenger.phoneNumber = phoneNum;
  passenger.age = age;
  passenger.location = location;
  passenger.destination = destination;

  passengers.add(passenger);
}
