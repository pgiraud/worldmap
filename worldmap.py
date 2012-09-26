#!/usr/bin/env python

from xml.dom import minidom
xmldoc = minidom.parse('worldmap.xml')

RESIZE_FACTOR = 4

def increase(s, attr):

    if s.attributes.has_key(attr):
        value = s.attributes[attr].value
        if attr == 'transform':
            prefix = 'scale('
            suffix = ')'
            value = value.replace(prefix, '')
            value = value.replace(suffix, '')
            value = str(float(value) * RESIZE_FACTOR)
            s.setAttribute(attr, '%s%s%s' % (prefix, value, suffix))
        else:
            values = value.split(',')
            n_values = []
            for v in values:
                n_values.append(str(float(v) * RESIZE_FACTOR))
            s.setAttribute(attr, ','.join(n_values))

for s in xmldoc.getElementsByTagName('MarkersSymbolizer'):
    for i in ['width']:
        increase(s, i)

for s in xmldoc.getElementsByTagName('PointSymbolizer'):
    for i in ['transform']:
        increase(s, i)

for s in xmldoc.getElementsByTagName('LineSymbolizer'):
    for i in ['stroke-width', 'stroke-dasharray']:
        increase(s, i)

for s in xmldoc.getElementsByTagName('TextSymbolizer'):
    for i in ['size', 'halo-radius', 'line-spacing', 'dx', 'dy']:
        increase(s, i)

f = file("worldmap_resized.xml", "w+b")
xmldoc.writexml(f)
f.close()

import mapnik
from mapnik import LineSymbolizer, PolygonSymbolizer

map = mapnik.Map(13800, 7024)

stylesheet = 'worldmap_resized.xml'
mapnik.load_map(map, stylesheet)

#srs = "+proj=robin +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"
srs = "+proj=natearth +wkttext"
map.srs = srs

robin = mapnik.Projection(srs)
#long_lat_bounds = mapnik.Box2d(-10, 25, 40, 55)
long_lat_bounds = mapnik.Box2d(0, 0, 90, 45)
#long_lat_bounds = mapnik.Box2d(-180, -90, 180, 90)
robin_bounds = robin.forward(long_lat_bounds)


#ds = mapnik.Gdal(file= "/Users/macbookpro/Documents/mapbox/project/worldmap2/layers/natural-earth-2-robinson.tif")
#ds = mapnik.Gdal(file= "/Users/macbookpro/Downloads/3D/ct3d_hillshade.tif")
ds = mapnik.Gdal(file= "/Users/macbookpro/Documents/mapbox_seed/map_natearth_compressed.tif")
geotiff = map.layers[0]
geotiff.datasource = ds
geotiff.srs = srs

map.extent = robin_bounds
map.zoom_to_box(robin_bounds)

image = '/Users/macbookpro/Documents/worldmap.jpeg'
mapnik.render_to_file(map, image)
print "rendered image to '%s'" % image
