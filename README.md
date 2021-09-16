# Naming convention:

## Classes, enums, typedefs, and extensions name should be in UpperCamelCase.  
ex: class TopBar{} ,enum ScreenState{}
## Libraries, packages, directories, and source files name should be in snake_case(lowercase_with_underscores).  
library widget;
import ‘socket/socket_manager.dart’
## Variables, constants, parameters, and named parameters should be in lowerCamelCase.
var item;
const testValue= 14.28;
final urlScheme = RegExp(‘^([a-z]+):’);
void sum(int testValue) { // …}


# Imports for files in lib
 When using relative and absolute imports together then It is possible to create confusion when the same class gets imported from two different ways. 
 To avoid this case we should Choose the one of  the ways[Relative or absolute] and stick to that thought the project

 From the Dart guidelines, further down they give this reason for the relative imports: 
 There is no profound reason to prefer the former—it’s just shorter, and we want to be consistent.

 Personally, I prefer the absolute method, despite it being more verbose, as it means when I'm importing from different dart files (in other folders), I don't ##   have to work out where the file to be imported is, relative to the current file. Made-up example:
 I have two dart files, at different folder levels, that need to import themes/style.dart:
 
 One is widgets/animation/box_anim.dart, where the relative path import would be: import '../../themes/style.dart';
 The other is screens/home_screen.dart with the relative import:  import '../themes/style.dart';

 This can get confusing, so I find it better to just use the absolute in both files,  keeping it consistent:  import 'package:myapp/themes/style.dart';

## Specify types for class member

### Always specify the type of member when its value type is known. Avoid using var when possible.

      //Don't
      var item = 10;
      final car = Car();
      const timeOut = 2000;


      //Do
      int item = 10;
      final Car bar = Car();
      String name = 'john';
      const int timeOut = 20;

## Avoid using as instead, use is operator

### Usually, The as cast operator throws an exception if the cast is not possible. To avoid an exception being thrown, one can use is.

      //Don't
      (item as Animal).name = 'Lion';

      //Do
      if (item is Animal)
        item.name = 'Lion';

## Use if condition instead of conditional expression

### Many times we need to render a widget based on some conditions in Row and Column. If conditional expression return null in any case then we should use if condition only.

      //Don't
      Widget getText(BuildContext context) {
        return Row(
          children: [
            Text("Hello"),
            Platform.isAndroid ? Text("Android") : null,
            Platform.isAndroid ? Text("Android") : SizeBox(),
            Platform.isAndroid ? Text("Android") : Container(),
          ]
        );
      }


      //Do
      Widget getText(BuildContext context) {
        return Row(
            children: 
            [
              Text("Hello"), 
              if (Platform.isAndroid) Text("Android")
            ]
        );
      }

## Use ?? and ?. operators

### Prefer using ?? (if null) and ?. (null aware) operators instead of null checks in conditional expressions.
      //Don't
      v = a == null ? b : a;
      //Do
      v = a ?? b;

      //Don't
      v = a == null ? null : a.b;
      //Do
      v = a?.b;

## Use interpolation to compose strings

      //Don’t
      var description = 'Hello, ' + name + '! You are ' + (year - birth).toString() + ' years old.';


      // Do
      var description = 'Hello, $name! You are ${year - birth} years old.';


    
# Project Structure

* project-name
  * assests
    * fonts
      * roboto_light.ttf      
    * images
      *  ic_splash.png //1.0x [mdpi]
      *  facebook.svg
      *  1.5x
          * ic_splash.png [hdpi]
      *  2.0x
          * ic_splash.png [xhdpi]
      *  3.0x
          * ic_splash.png [xxhdpi]
      *  4.0x
          * ic_splash.png [xxxhdpi]
   * lib
      * main.dart
      * base
        * base_class.dart
      * screens
        * login
          * login_screen.dart
          * bloc
            * login_bloc.dart
            * login_event.dart
            * login_state.dart
          * login.dart
        * home
          * home_screen.dart
          * bloc
            * home_bloc.dart
            * home_event.dart
            * home_state.dart
          * home.dart
    * values
      * colors.dart
      * strings.dart
      * images.dart
      * dimen.dart
    * utils
      * app_constant.dart
      * api_constant.dart
    * widget
      * app_button.dart
      * app_textview.dart
      
    

