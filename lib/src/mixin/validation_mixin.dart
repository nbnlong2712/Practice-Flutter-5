class ValidationMixin {
  String? validationEmail(String? email) {
    if (!email!.contains("@")) {
      return "Invalid email!";
    }
  }

  String? validationPassword(String? password) {
    if (password!.length < 8) {
      return "Invalid password!";
    }
  }
}
