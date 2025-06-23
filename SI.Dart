class Student{
  String? _name;
  static int numberOfStudents=0;
  Student(String name){
    this._name = name;
    numberOfStudents++;
  }
  set setName(String? name){
    this._name = name;
  }
  String? get getName{
    return _name;
  }
}
void main(){
  Student s1= Student("John");
  Student s2= Student("Jane");
  Student s3= Student("Doe");
  //instance
  s1.setName = "Alice";
  print("Student 1: ${s1.getName}");
  //Static 
  print("Number of student :${Student.numberOfStudents}");
}