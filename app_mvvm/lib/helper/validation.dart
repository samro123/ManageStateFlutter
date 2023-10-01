class Validation{
  static dynamic validatePass(String pass){
     if(pass == null){
       return 'Password invalid';
     }
     if(pass.length < 6){
       return 'Password require minimum 6 characters';
     }

    return null;
  }

  static dynamic validateEmail(String email){
    if(email == null){
      return 'Email invalid';
    }
    var emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(!emailValid){
      return 'Email invalid';
    }
    return null;
  }
}