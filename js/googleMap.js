/**
 * Created by Администратор on 18.12.2014.
 */
$(function (){
    var myLatlng = new google.maps.LatLng(54.182, 45.182);
    var myOptions = {
        zoom: 8,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    window.found_map = map;
});

