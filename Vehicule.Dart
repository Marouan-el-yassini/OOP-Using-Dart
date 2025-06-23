
abstract class Vehicule{
  //Private attributes
  String? _brand;
  int? _year;
  double? _price;  
  //Constructor
  Vehicule({required String brand,required int year,required double price}){
    if(year<1900 || year>DateTime.now().year){
      throw Exception("Year must be between 1900 and the current year.");
    }
    if(price<0){
      throw Exception("Price must be a positive value.");
    }

    this._brand = brand;
    this._year = year;
    this._price = price;
  }

  //Getters and Setters

  set setBrand(String? brand){
    this._brand = brand;
  }
  String? get getBrand{
    return _brand;
  }
  set setYear(int? year){
    this._year = year;
  }
  int? get getYear{
    return _year;
  }
  set setPrice(double? price){
    this._price = price;
  }
  double? get getPrice{
    return _price;
  }

  //Abstract method
  void displayInfo();

  //Concrete method 
  void startEngine(){
    print("the engine of $_brand is started.");
  }

}

abstract class ServiceAble{
  void performService();
}

class Car extends Vehicule implements ServiceAble {

   Car({required String brand, required int year, required double price})
      : super(brand: brand, year: year, price: price);

  @override
  void displayInfo() {
    print("Car Info: Brand: $_brand, Year: $_year, Price: $_price");
  }

  @override
  void performService() {
    print("Car Serviced");
  }
}

class Bike extends Vehicule implements ServiceAble{

  Bike({required String brand,required int year,required double price}) :super(brand:brand,year:year,price:price);
  @override
  void displayInfo(){
    print("bike Info: Brand :$_brand, Years: $_year ,Price:$_price");
  }

  @override
  void performService(){
    print("Bike is Serviced");
  }
}

void main(){
    Car c=Car(brand:"mercedes",year:2020,price:20000);
    c.displayInfo();
    c.performService();
  
}