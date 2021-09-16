#. Naming convention

### 1.Classes, enums, typedefs, and extensions name should be in UpperCamelCase.

      ex: class TopBar{} ,enum ScreenState{}

### 2.Libraries, packages, directories, and source files name should be in snake_case(lowercase_with_underscores).

      library widget;
      import ‘socket/socket_manager.dart’

### 3.Variables, constants, parameters, and named parameters should be in lowerCamelCase.

    var item;
    const testValue= 14.28;
    final urlScheme = RegExp(‘^([a-z]+):’);
    void sum(int testValue) { // …}

# Strings

### 1.PREFER using interpolation to compose strings and values.Generally, we are used to using long chains of + to build a string out of literals and other values. That does work in Dart, but it’s almost always cleaner and shorter to use interpolation:
    'Hello, $name! You are ${year - birth} years old.';
### 2 . AVOID using curly braces in interpolation when not needed.If you’re interpolating a simple identifier not immediately followed by more alphanumeric text, the {} should be omitted.
    'Hi, $name!' "Wear your wildest $decade's outfit."

# Specify types for class member
    Always specify the type of member when it’s value type is known. Avoid using var when possible.
   
    int item = 10;
    final User user = User();
    String name = ‘pooja’;
    const int timeOut = 20;

# Use if condition instead of conditional expression

    
    

