String? validatePhone(String value) {
  String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  RegExp regExp = new RegExp(pattern);

  if (value.length == 0) {
    return "Phone Number is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Phone Number must be between 10 to 12 digit";
  }
  return null;
}

String? validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "Email is Required";
  } else if(!regExp.hasMatch(value)){
    return "Invalid Email";
  }else {
    return null;
  }
}

String? validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value))
      return 'Your password must contain at least one capital letter,number and special character';
    else
      return null;
  }
}