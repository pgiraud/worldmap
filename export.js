var mapnik = require('mapnik');
var fs = require('fs');

// register fonts and datasource plugins
mapnik.register_default_fonts();
mapnik.register_system_fonts();
mapnik.register_default_input_plugins();

// 27566px @300dpi -> 233cm
// 14032px @300dpi -> 118cm
var width = 27566;
var height = 14032;

width = width / 2;
height = height / 2;

var extents = [
    //[-17446643.326, -8880611.844, 17446602.683, 8880981.952],
    [ -17822413.40452914, 0, 0, 9072201.519427164 ],
    [ 0, 0, 17822404.45844891, 9072201.519427164 ],
    //[ -17822413.40452914, -9072201.516892482, 0, 0 ],
    //[ 0, -9072201.516892482, 17822404.45844891, 0 ]
];

function onLoad(map, j) {
    var im = new mapnik.Image(width, height);
    //map.zoomAll();
    map.extent = extents[j];
    console.log("rendering map" + j);
    map.renderFile('map' + j + '.png', {format: 'png'}, function(err) {
      if (err) throw err;
    });
}

extents.forEach(function(extent, index) {
    var map = new mapnik.Map(width, height);
    map.load('worldmap_resized.xml', function(err, map) {
        if (err) throw err;
        onLoad.call(null, map, index);
    });
});

// when finished use the following command to export to pdf
// convert -density 300 map.png map.pdf
