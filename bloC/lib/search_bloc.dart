import 'dart:async';
class SearchBloc{

   final List<String> Data = [
    "IOS",
    "Android",
    "GoLang",
    "Flutter",
    "React Native",
    "Python",
    "Java",
    "Ruby",
    "Php",
    "C++"
  ];

  StreamController<List<String>> searchControlor =
      StreamController<List<String>>();

  search(String query){
    //print(query);
    if(query.isEmpty){
      searchControlor.sink.add(Data);
      return;
    }

    _filter(query).then((value){
      searchControlor.sink.add(value);
    });
  }


  Future<List<String>> _filter(String query) async{
        var c = Completer<List<String>>();
        List<String> result = [];
        Data.forEach((value) {
          if(value.contains(query)){
            result.add(value);
          }
        });

        c.complete(result);
        return c.future;
  }

  //Dong ham streamcontroller
  dispose(){
    searchControlor.close();
  }
}