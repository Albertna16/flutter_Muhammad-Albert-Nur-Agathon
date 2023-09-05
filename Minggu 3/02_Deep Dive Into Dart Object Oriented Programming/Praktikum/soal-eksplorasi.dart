abstract class Shape {
  double getArea() {
    return 0;
  }

  double getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  int radius;
  Circle(this.radius);
  @override
  double getArea() {
    return 22 / 7 * radius * radius;
  }

  @override
  double getPerimeter() {
    return 2 * 22 / 7 * radius;
  }
}

class Square implements Shape {
  int side;

  Square(this.side);
  @override
  double getArea() {
    return (side * side).toDouble();
  }

  @override
  double getPerimeter() {
    return (4 * side).toDouble();
  }
}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle({required this.width, required this.height});
  @override
  double getArea() {
    return (width * height).toDouble();
  }

  @override
  double getPerimeter() {
    return (2 * (width + height)).toDouble();
  }
}

void main() {
  Circle circle = Circle(14);
  Square square = Square(5);
  Rectangle rectangle = Rectangle(width: 10, height: 8);

  print("Lingkaran");
  print("Jari jari\t\t\t: 14");
  print("Luas lingkaran\t\t\t: ${circle.getArea()}");
  print("Keliling lingkaran\t\t: ${circle.getPerimeter()}\n");

  print("Persegi");
  print("Sisi\t\t\t\t: 5");
  print("Luas persegi\t\t\t: ${square.getArea()}");
  print("Keliling persegi\t\t: ${square.getPerimeter()}\n");

  print("Persegi Panjang");
  print("Lebar\t\t\t\t: 10");
  print("Tinggi\t\t\t\t: 8");
  print("Luas persegi panjang\t\t: ${rectangle.getArea()}");
  print("Keliling persegi panjang\t: ${rectangle.getPerimeter()}\n");
}
