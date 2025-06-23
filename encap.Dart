class Student{
  String? _name;
  Student(String name){
    this._name=name;
  }
  void setname(String name){
    this._name=name;
  }
  String? getname(){
    return this._name;
  }
}

class Animal{
  String? _type;
  Animal(String type){
    this._type=type;
  }
  set typee(String? type){
    this._type=type;
  }
  String? get typee{
    return _type;
  }
}
void main(){
  Student s=Student("Marwan");
  s.setname("Marouan");
  print(s.getname());

  Animal a=Animal("Dog");
  a.typee="Cat";
  print(a.typee);
}