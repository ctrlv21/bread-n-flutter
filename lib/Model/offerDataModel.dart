class OfferDataModel{
  String _bankName="";
  String _cardType="";
  String _details="";
  String _dueDate="";
  String _url="";

  String get bankName{
    if(_bankName == null)
      return "";
    else
      return _bankName;
  }
  set bankName(value) {
    if(value == null) {
      _bankName = "";
    } else {
      _bankName = value;
    }
  }

  String get cardType{
    if(_cardType == null)
      return "";
    else
      return _cardType;
  }
  set cardType(value) {
    if(value == null)
      _cardType = "";
    else
      _cardType = value;
  }

  String get details{
    if(_details == null)
      return "";
    else
      return _details;
  }
  set details(value) {
    if(value == null)
      _details = "";
    else
      _details = value;
  }

  String get dueDate{
    if(_dueDate == null)
      return "";
    else
      return _dueDate;
  }
  set dueDate(value) {
    if(value == null)
      _dueDate = "";
    else
      _dueDate = value;
  }

  String get url{
    if(_url == null)
      return "";
    else
      return _url;
  }
  set url(value) {
    if(value == null)
      _url = "";
    else
      _url = value;
  }
}