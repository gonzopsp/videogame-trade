import 'package:flutter/foundation.dart';

class CartItem{
  final int id;
  final String nombre;
  final double precio;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.imageUrl
  });
}

class CartModel extends ChangeNotifier {
  final Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  double get precioTotal{
    double total = 0.0;
    _items.forEach((key, item){
      total += item.precio;
    });
    return total;
  }

  void addItem(int id, String nombre, double precio, String imageUrl){
    if(!_items.containsKey(id)){
      _items[id] = CartItem(id: id, nombre: nombre, precio: precio, imageUrl: imageUrl);
    }
    notifyListeners();
  }

  void removeItem(int id){
    if (!_items.containsKey(id)) return;
    _items.remove(id);
    notifyListeners();
  }

  void clear(){
    _items.clear();
    notifyListeners();
  }

}
