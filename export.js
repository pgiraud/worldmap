var mapnik = require('mapnik');
var fs = require('fs');

// register fonts and datasource plugins
mapnik.register_default_fonts();
mapnik.register_fonts('/Library/Fonts');
mapnik.register_default_input_plugins();

var width = 25295;
var height = 12876;

var map = new mapnik.Map(width, height);
map.load('worldmap_resized.xml', function(err,map) {
    if (err) throw err;
    var im = new mapnik.Image(width, height);
    map.zoomAll();

    map.render(im, function(err,im) {
      if (err) throw err;
      im.encode('png', function(err,buffer) {
          if (err) throw err;
          fs.writeFile('map.png',buffer, function(err) {
              if (err) throw err;
              console.log('saved map image to map.png');
          });
      });
    });
});
