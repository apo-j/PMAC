//Module utilities
(function(utils){
    var self = utils;
    self.post = function (url, params, doneCallback, failCallback, alwaysCallback){
        $.ajax({
            url:url,
            type:'POST',
            data: params
        }).done(function(data){
           if(!!doneCallback && typeof doneCallback === 'function'){
               doneCallback(data);
           }
        }).fail(function(data){
           if(!!failCallback && typeof failCallback === 'function'){
               failCallback(data);
           }
        }).always(function(data){
           if(!!alwaysCallback && typeof alwaysCallback === 'function'){
               alwaysCallback(data);
           }
        });
    };

    self.navigatorLanguage = function(){
        var userLang = navigator.language || navigator.userLanguage;
        switch(userLang.substring(0,2)){
            case 'fr' :
                return enums.languageEnum.French;
            case 'zh':
                return enums.languageEnum.French;
            default :
                return enums.languageEnum.English;
        }
    };

    self.numberToEuro = function(number){
        var numberStr = parseFloat(number).toFixed(2).toString();
        var numFormatDec = numberStr.slice(-2); /*decimal 00*/
        numberStr = numberStr.substring(0, numberStr.length-3); /*cut last 3 strings*/
        var numFormat = new Array;
        while (numberStr.length > 3) {
            numFormat.unshift(numberStr.slice(-3));
            numberStr = numberStr.substring(0, numberStr.length-3);
        }
        numFormat.unshift(numberStr);
        return numFormat.join('.')+','+numFormatDec + '€'; /*format 000.000.000,00 */
    }

    self.splitStringToArray = function(str, delimiter){
      var _res = [];
      var _delimiter = delimiter || '|';
      if(str){
         arr =  str.split(_delimiter);
         for(var i = 0, j = arr.length; i < j; i++ ){
             if(arr[i] && arr[i] != ''){
                 _res.push(parseInt(arr[i]));
             }else{
                 _res.push(0);
             }
         }
      }
       return _res;
    };

    self.arrayRange = function(array, range){
        if(array && array.length > 0){
             range.left(array[0]);
             range.right(array[array.length - 1]);
        }else{
            range.left(0);
            range.right(0);
        }
    };

    self.b_search = function(array, v){
       var low = 0;
       var mid = 0;
       var high = array.length - 1;
       while( low <= high){
           mid = Math.floor((low + high) / 2);
           if(array[mid] == v){
               return mid;
           }else if(array[mid] < v){
               if(mid + 1 < array.length && array[mid + 1] >= v){
                   return mid + 1;
               }
               low = mid + 1;
           }else if(array[mid] > v){
               if (mid - 1 >= 0 && array[mid - 1] <= v){
                   return mid
               }
               high = mid -1
           } else {
               return mid + 1
           }
       }
       return -1;
    }

    return self;
}(utilities || {}))