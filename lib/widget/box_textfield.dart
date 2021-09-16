import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BoxTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? autofocus;
  final bool? obscureText;
  final bool? autocorrect;
  final int? maxLines ;
  final Key? key;
  final int? maxLength;
  final bool? maxLengthEnforced;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final IconData? icon;
  final Color? iconColor;
  final Color? focusBorderColor;
  final String? hintText;
  final String? errorText;
  final String? lableText;
  final double? cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Color? defaultBorderColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets? scrollPadding;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  final FormFieldSetter<String>? onSaved;

  const BoxTextField({
    this.key,
    this.focusNode,
    this.style,
    this.controller,
    TextInputType keyboardType = TextInputType.name,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.icon,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.maxLength ,
    this.onSaved,
    this.hintText,
    this.errorText,
    this.lableText,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.defaultBorderColor,
    this.onEditingComplete,
    this.onSubmitted,
    this.iconColor,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.focusBorderColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.validator,
    this.onFieldSubmitted,
  })  : assert(textAlign != null),
        assert(autofocus != null),
        assert(obscureText != null),
        assert(autocorrect != null),
        assert(maxLengthEnforced != null),
        assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        keyboardType = keyboardType;

  @override
  _BoxTextFieldState createState() => _BoxTextFieldState();
}

class _BoxTextFieldState extends State<BoxTextField> {
  late double width;
  late double height;
  Color focusBorderColor = Colors.grey.shade400;
  FocusNode _focusNode = FocusNode();
  late ValueChanged<Colors> focusColorChange;

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
                // margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                alignment: Alignment.center,
//                height: size.getWidthPx(45),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    //border:  Border.all(color: widget.focusBorderColor??Colors.grey.shade400, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child: TextFormField(
                  maxLength: widget.maxLength,
                  keyboardType: widget.keyboardType,
                  key: widget.key,
//                  style: TextStyle(fontFamily: 'Exo2'),
                  obscureText: widget.obscureText!,
                  controller: widget.controller,
                  onSaved: widget.onSaved,
                  validator: widget.validator,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    counter: Offstage(),
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                    suffixIcon: Icon(
                      widget.icon,
                      color: widget.iconColor,
                      size: 22,
                    ),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(fontSize: 13.0),
                    errorText: widget.errorText,
                  ),
                ),
              )),
        ],
      ),
      padding: EdgeInsets.only(bottom: 2),
      margin: EdgeInsets.only(
        top: 8,
        right: 4,
        left: 4,
      ),

    );
  }
}