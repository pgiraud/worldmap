var mapnik = require('mapnik');
var fs = require('fs');

// register fonts and datasource plugins
mapnik.register_default_fonts();
mapnik.register_system_fonts();
mapnik.register_default_input_plugins();

var width = 25295;
var height = 12876;

var extents = [
    //[ -17822413.40452914, 0, 0, 9072201.519427164 ],
    [ 0, 0, 17822404.45844891, 9072201.519427164 ]
    //[ -17822413.40452914, -9072201.516892482, 0, 0 ],
    //[ 0, -9072201.516892482, 17822404.45844891, 0 ]
];

function onLoad(map, j) {
    var im = new mapnik.Image(width, height);
    map.zoomAll();
    map.extent = extents[j];
    console.log("rendering map" + j);
    map.renderFile('map' + j + '.jpg', {format: 'jpeg'}, function(err) {
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

        //map.render(im, function(err,im) {
          //if (err) throw err;
          //im.encode('tiff', function(err,buffer) {
              //if (err) throw err;
              //fs.writeFile('map.tif', buffer, function(err) {
                  //if (err) throw err;
                  //console.log('saved map image to map.tif');
              //});
          //});
        //});
