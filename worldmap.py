#.save(image + '.tif')!/usr/bin/env python

from xml.dom import minidom
import datetime
import math
import os, io
import subprocess

from PIL import Image

print "Transforming shapefile data"
subprocess.call("sh transform_data.sh", shell=True)

print "Parsing mapfile"
xmldoc = minidom.parse('worldmap.xml')

RATIO = 1 / 0.33
RASTER_BOUNDS = (-17446643.326, -8880879.442, 17446466.468, 8880981.952) 
RASTER_SIZE = (int(114981 / RATIO), int(58529 / RATIO))
COLS = 15 
TILE_SIZE = RASTER_SIZE[0] / COLS
X_GUTTER = 1.4

# font size, line width resize factor
RESIZE_FACTOR = 7 / RATIO 

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

for s in xmldoc.getElementsByTagName('Parameter'):
    if s.attributes.has_key('name') and s.attributes['name'].value == 'file':
        cdata = s.firstChild
        if 'shp' in cdata.data:
            cdata.data = '/tmp/' + os.path.basename(cdata.data)

f = file("worldmap_resized.xml", "w+b")
print "Writing resized mapfile"
xmldoc.writexml(f)
f.close()

import mapnik
from mapnik import LineSymbolizer, PolygonSymbolizer

map = mapnik.Map(int(math.ceil(TILE_SIZE * X_GUTTER)),
        RASTER_SIZE[1])
print "Map size : %s x %s" % (map.width, map.height)

stylesheet = 'worldmap_resized.xml'
print "Loading map"
mapnik.load_map(map, stylesheet)

#srs = "+proj=robin +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"
srs = "+proj=natearth +wkttext"
map.srs = srs

ds = mapnik.Gdal(file= "layers/map_natearth_compressed_small.tif")
geotiff = map.layers[0]
geotiff.datasource = ds
geotiff.srs = srs

for i in map.layers:
    i.srs = srs

print "Setting projection"
projection = mapnik.Projection(srs)
#long_lat_bounds = mapnik.Box2d(-180, -90, 180, 90)
#robin_bounds = robin.forward(long_lat_bounds)

RASTER_GEO_SIZE = RASTER_BOUNDS[2] - RASTER_BOUNDS[0]
TILE_GEO_SIZE = RASTER_GEO_SIZE / COLS

# offset in pixel from the left border of the worldmap image
offset = 0
for i in range(0, COLS):
#for i in range(3, 5):
    start = datetime.datetime.now()

    x_min = RASTER_BOUNDS[0] + i * TILE_GEO_SIZE
    x_max = x_min + TILE_GEO_SIZE
    margin = TILE_GEO_SIZE * (1 - X_GUTTER)

    bounds = mapnik.Box2d(x_min - margin, RASTER_BOUNDS[1],
            x_max + margin, RASTER_BOUNDS[3])
    print "Map bounds : %s" % bounds

    map.extent = bounds
    map.zoom_to_box(bounds)

    image = 'export/worldmap_%02d' % i
    print "Rendering image %s" % image
    mapnik.render_to_file(map, image + '.png')
    end = datetime.datetime.now()
    duration = end - start
    print "rendered image to '%s' in %s seconds" % (image, duration.seconds)

    im = Image.open(image + '.png')
    #if i == 0:
        #xmin = 0
    #else:
    xmin = int(TILE_SIZE * (X_GUTTER - 1) / 2) 
    if i == COLS - 1:
        xmax = TILE_SIZE
    else:
        xmax = int(TILE_SIZE + TILE_SIZE * (X_GUTTER - 1) / 2)
    box = (xmin,
           0,
           xmax,
           int(RASTER_SIZE[1]))
    print "Cropping "

    cropped = im.crop(box)
    cropped.save(image + '.tif')
    os.remove(image + '.png');

    # Create the new tfw file for writing
    # This world file takes pixels coordinates into account
    config = io.open(image + '.tfw', 'w')

    # Read the lines from the template, substitute the values
    for line in io.open('template.tfw', 'r'):
        line = line.replace('X_ORIG', str(i * TILE_SIZE))
        config.write(line)

    # Close the files
    config.close()

print "Done ! Now you can launch the following command: 'cd export && gdal_merge.py -o worldmap.tif -co COMPRESS=DEFLATE -co TILED=YES worldmap_*.tif'."
print "It may take a while."
print "Then convert it to PDF : 'gdal_translate worldmap.tif worldmap.pdf'."
print "To split the file into small pieces to be printed on A4 sheets, use the folllowing:"
print "gdal_retile.py -ps 2480 3508 worldmap.tif -targetDir tmp"
