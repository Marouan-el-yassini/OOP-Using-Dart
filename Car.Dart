class Car{
  String model;
  double price;
  int years;

  Car({
       required this.model,
       required this.price,
       required this.years
  });

  void displaCar(){
    print("The car is :$model----$price----$years");
  }
}

class Cart{
  List<Car> car=[];

  void addCars(Car c){
    car.add(c);
  }

  void removeCar(String model){
    bool found =false;
    for(int i=0;i<car.length;i++){
      if(car[i].model==model){
        car.removeAt(i);
        found=true;
        print("Car $model is removed succesfuly");
        break;
      }
    }
  }

  void displayCart(){
    if(car.isEmpty){
      print("empty");
    }
    else{
      for(var cc in car){
        cc.displaCar();
      }
    }
  }

  double totalPrice(){
    double total=0.0;
    for(var cc in car){
      total +=cc.price;
    }
    return total;

  }
}

void main(){
  Car mercedes=Car(model:"Marcedes",price:80,years:2023);
  Car bmw=Car(model:"BMW",price:60,years:2020);
  Car audi=Car(model:"Audi",price:70,years:2022);
  Car dacia=Car(model:"Dacia",price:20,years:2025);

  mercedes.displaCar();
  bmw.displaCar();
  audi.displaCar();
  dacia.displaCar();

  Cart cart=Cart();

  cart.addCars(mercedes);
  cart.addCars(bmw);
  cart.addCars(audi);
  cart.addCars(dacia);

  cart.removeCar("Audi");

  cart.displayCart();

  var total=cart.totalPrice();

  print("the total is $total ");
  
  
}