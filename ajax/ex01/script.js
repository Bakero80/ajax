$(function(){

    $('#butapp').click(function(){
    $.get(
        "http://www.prevision-meteo.ch/services/json/nantes",

        function(data) {
            var lever = "A Nantes le soleil se couche à " + data.city_info.sunrise;
            lever += '<img src="http://www.prevision-meteo.ch/style/images/icon/nuit-nuageuse.png" >'+data.city_info.icon;
            $('#soleil').html(lever);
        }).fail(function(){
        alert("error");
    });

    });
});
