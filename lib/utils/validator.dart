class Validator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return '이메일을 입력하세요.';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return '올바른 이메일 주소를 입력하세요.';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '비밀번호를 입력하세요.';
    } else if (password.length < 6) {
      return '비밀번호는 최소 6자 이상이어야 합니다.';
    }
    return null;
  }
}
