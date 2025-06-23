import 'dart:io';

class Person {
  String name;
  int age;

  Person({
    required this.name,
    required this.age,
  });

  void displayPerson() {
    print("Hey, my name is $name and I'm $age years old.");
  }
}

class Student extends Person {
  var grade;

  Student({
    required String name,
    required int age,
    required this.grade,
  }) : super(name: name, age: age);

  Student.fromPerson({
    required Person person,
    required this.grade,
  }) : super(name: person.name, age: person.age);

  void displayStudent() {
    print("Hey, my name is $name and I'm $age years old and my grade is $grade. The exam will be on 15/12/2026.");
  }
  //the concept of overriding
  //overriding is when a subclass provides a specific implementation of a method that is already defined in its superclass.
  
  @override
  void displayPerson(){
    super.displayPerson();
    print("I am a student and my grade is $grade.");
  }
}

class Teacher extends Person {
  String subject;

  Teacher({
    required String name,
    required int age,
    required this.subject,
  }) : super(name: name, age: age);

  Teacher.fromPerson({
    required Person person,
    required this.subject,
  }) : super(name: person.name, age: person.age);

  void displayTeacher() {
    print("Hey, I'm a teacher. My name is $name, I'm $age years old, and I teach $subject. The exam will be on 15/12/2026.");
  }
}

class Administration extends Person {
  String position;

  Administration({
    required String name,
    required int age,
    required this.position,
  }) : super(name: name, age: age);

  Administration.fromPerson({
    required Person person,
    required this.position,
  }) : super(name: person.name, age: person.age);

  void displayAdministration() {
    print("Hey, I'm $position. My name is $name and I'm $age years old.the current year is ${DateTime.now().year}.");
  }
}

void main() {
  print("entrer you name and age:");
  String? name=stdin.readLineSync();
  int? aga =int.tryParse(stdin.readLineSync() ?? '');
  Person p = Person(name: name!, age: aga!);
  p.displayPerson();

  print("Tell me about your function in the school: Student, Teacher or Administration:");
  String? choice = stdin.readLineSync();

  switch (choice) {
    case "Student":
      print("Enter your grade:");
      var grade = stdin.readLineSync();
      Student s = Student.fromPerson(person: p, grade: grade);
      s.displayPerson();
      break;

    case "Teacher":
      print("Enter your subject:");
      var sub = stdin.readLineSync();
      Teacher t = Teacher.fromPerson(person: p, subject: sub!);
      t.displayTeacher();
      break;

    case "Administration":
      print("Enter your position:");
      var pos = stdin.readLineSync();
      Administration a = Administration.fromPerson(person: p, position: pos!);
      a.displayAdministration();
      break;

    default:
      print("Invalid input. Please type Student, Teacher, or Administration.");
      break;
  }
}
