define(function () {
    require.config({
        shim:{
            'jquery':{
                exports:'$'
            }
        },
        paths:{
            "web-key":"http://webapi.amap.com/maps?v=1.4.0&key=c164752710e569fad431743aa3669262",
            "map-ui":"http://webapi.amap.com/ui/1.0/main",
            'jquery':"../lib/jquery-3.2.1.min"
        }
    });
});