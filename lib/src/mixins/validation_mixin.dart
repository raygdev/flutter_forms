mixin ValidationMixin {
  String? validateEmail(String? value) {
    if(value == null || !value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.length < 4) {
      return 'Please enter a valid password';
    }
    return null;
  }
}