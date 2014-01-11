ko.bindingHandlers.translate = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = ko.utils.unwrapObservable(valueAccessor()) || '';

        if(value != ''){
            if(vars.isTranslateOn){
                $(element).text(translator.translate(value));
            }else{
                $(element).text(value);
            }
        }else{
            $(element).addClass('hide');
        }
    }
};

ko.bindingHandlers.translateInnerText = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = $(element).text();

        if(value != ''){
            if(vars.isTranslateOn){
                $(element).text(translator.translate(value));
            }else{
                $(element).text(value);
            }
        }
    }
};

ko.bindingHandlers.slider = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = ko.utils.unwrapObservable(valueAccessor()) || {srcs:[], options:{}};
        var _options = $.extend(static.sliderOptions, value.options);


        var srcs = ko.toJS(value.srcs);
        if(srcs && srcs.length > 0){
            var str = "";
            for(var i = 0, j = srcs.length; i < j; i++){
                str += "<li><img src='#{src}'/></li>".replace("#{src}", srcs[i].src || srcs[i]);
            }
            $(element).append(str).bxSlider(_options);
        }
    }
};

ko.bindingHandlers.display = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = ko.utils.unwrapObservable(valueAccessor()) || {};

        if(static.isTranslateOn && !!value.on){
                if(value.supportLanguages.indexOf(translator.currentLanguage()) === -1){
                    $(element).addClass('hide');
                }else{
                    $(element).removeClass('hide');
                }
            };
    }
};

ko.bindingHandlers.dataAttr = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
		var value = ko.utils.unwrapObservable(valueAccessor());
		
		for(var i in value){
			if(value.hasOwnProperty(i) && !! value[i]){
				$(element).data(i, value[i]);
			}
		}
    }
};


ko.bindingHandlers.Example = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
		var value = ko.utils.unwrapObservable(valueAccessor());

		$(element).attr('src', value);
    },
    update: function (element, valueAccessor) {
        var current = ko.utils.unwrapObservable(valueAccessor());
		var value = $(element).data('orgin');

        if (value !== current) {
		   $(element).css('outline', '1px solid red');
        }else{
			$(element).css('outline', '0');
		}
    }
};
ko.bindingHandlers.cVisible = {
    init: function (element, valueAccessor, allBindingsAccessor, viewModel) {
        var value = ko.utils.unwrapObservable(valueAccessor()) || false;

        var needLogin = $(element).data('onauthenticate') || false;
        var signedIn = isSignedIn || false;
        if(value && needLogin == true && !signedIn){
            $(element).remove();
        }
    }
};

ko.bindingHandlers.stopBindings = {
    init: function() {
        return { controlsDescendantBindings: true };
    }
};

//DatePicker
ko.bindingHandlers.datepicker = {
    init: function (element, valueAccessor, allBindingsAccessor) {
        //initialize datepicker with some optional options
        var options = allBindingsAccessor().datepickerOptions || {};

        $(element).datepicker(options);

        //handle the field changing
        ko.utils.registerEventHandler(element, "change", function () {
            var observable = valueAccessor();
            //observable($(element).datepicker("getDate")); //Pour souci de format
            observable($(element).val());
        });

        //handle disposal (if KO removes by the template binding)
        ko.utils.domNodeDisposal.addDisposeCallback(element, function () {
            $(element).datepicker("destroy");
        });

    },
    update: function (element, valueAccessor, allBindingsAccessor) {
        var value = ko.utils.unwrapObservable(valueAccessor()),
            current = $(element).val(),
            options = allBindingsAccessor().datepickerOptions || {};

        //Rafraîchir les dates min/max
        if (options.minDate) {
            $(element).datepicker("option", "minDate", options.minDate);
        }
        if (options.maxDate) {
            $(element).datepicker("option", "maxDate", options.maxDate);
        }

        if (value - current !== 0) {
            $(element).datepicker("setDate", value);
        }
    }
};
