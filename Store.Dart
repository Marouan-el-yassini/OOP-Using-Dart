class Product {
  String name;
  double price;
  int quantity;

    Product({
    required this.name,
    required this.price,
    required this.quantity,
  });

  void affiche() {
    print("Product info: $name --- $price DH --- Quantity: $quantity");
  }
}

class Cart {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  void removeProduct(String name) {
    bool found = false;
    for (int i = 0; i < products.length; i++) {
      if (products[i].name.toLowerCase() == name.toLowerCase()) {
        products.removeAt(i);
        found = true;
        print("$name removed from the cart.");
        break;
      }
    }
    if (!found) {
      print("Product not found in the cart.");
    }
  }

  void displayCart() {
    if (products.isEmpty) {
      print("Cart is empty");
    } else {
      print("Products in the cart:");
      for (var product in products) {
        product.affiche();  
      }
    }
  }

  double totalPrice() {
    double total = 0.0;
    for (var product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }
}

void main() {
  Product tablette = Product(name:"Tablette",price: 2499,quantity: 3);
  Product phone1 = Product(name:"S20",price: 7599,quantity: 5);
  Product phone2 = Product(name:"16",price: 9999,quantity:2);

  Cart cart = Cart();

  cart.addProduct(tablette);
  cart.addProduct(phone1);
  cart.addProduct(phone2);

  cart.removeProduct("tablette");

  cart.displayCart();

  var totall = cart.totalPrice();

  print("The total of your products is $totall DH");
}
