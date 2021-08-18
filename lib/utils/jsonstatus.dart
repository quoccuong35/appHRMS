
class  JsonStatus {
  int _code;
  String _text;
  dynamic _data;

  int get code { 
      return _code; 
  }
  void set code(int _code) { 
      this._code = _code; 
   } 

  String get text { 
      return _text; 
  }
  void set text(String _text) { 
      this._text = _text; 
   } 
  dynamic get data { 
      return _data; 
  }
  void set data(dynamic _data) { 
      this._data = _data; 
   } 
}