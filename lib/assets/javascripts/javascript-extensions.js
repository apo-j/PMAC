String.IsNullOrEmpty = function(value) {
    var isNullOrEmpty = true;
    if (value) {
        if (typeof (value) == 'string') {
            if (value.length > 0)
                isNullOrEmpty = false;
        }
    }
    return isNullOrEmpty;
}

String.removeChangeLine = function(value){
    if(value){
        if (typeof (value) == 'string') {
            return value.replace(new RegExp("\n","gm"), '');
        }
    }
    return false;
}

String.removeWhiteSpace = function(value){
    if(value){
        if (typeof (value) == 'string') {
            return value.replace(/ /g, '');
        }
    }
    return false;
}

String.removeChangeLineAndWhiteSpace = function(value){
  if(value){
      if (typeof (value) == 'string') {
         return String.removeWhiteSpace(String.removeChangeLine(value));
      }
  }
    return false;
}


