String? emailValidation(text) {
  final bool emailValid =
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(text!);
  if (text == null || text.trim().isEmpty) {
    return 'Please Enter Your Email';
  }
  if(!emailValid){
    return 'Please Enter a Valid Email';
  }
  return null;
}