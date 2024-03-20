import 'dart:io';

// Interface
abstract class Animal {
  void speak();
}

// Parent class
class Pet {
  String name;

  Pet(this.name);

  void showDetails() {
    print('Name: $name');
  }
}

// Child class implementing an interface and overriding a method
class Dog extends Pet implements Animal {
  String breed;

  Dog(String name, this.breed) : super(name);

  @override
  void speak() {
    print('$name says Woof!');
  }
}

void main() {
  // Initialize an instance of Dog class with data from a file
  final dog = Dog.fromFile('dog_data.txt');
  dog.showDetails();
  dog.speak();

  // Demonstrate the use of a loop
  for (int i = 0; i < 3; i++) {
    print('Loop iteration $i');
  }
}

extension DogExtension on Dog {
  // Method to initialize a Dog instance with data from a file
  factory Dog.fromFile(String filePath) {
    final file = File(filePath);
    final lines = file.readAsLinesSync();
    final name = lines[0];
    final breed = lines[1];
    return Dog(name, breed);
  }
}
