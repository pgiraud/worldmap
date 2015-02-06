#! /usr/bin/env python

from xml.dom import minidom
import datetime
import math
import os
import io
import subprocess

from PIL import Image

print "Transforming shapefile data"
subprocess.call("sh transform_data.sh", shell=True)

print "Parsing mapfile"
worldmap_path = '/Users/pierregiraud/Downloads/worldmap.xml'
xmldoc = minidom.parse(worldmap_path)

RATIO = 1 / 0.22
RASTER_BOUNDS = (-17446643.326, -8880879.442, 17446466.468, 8880981.952)
RASTER_SIZE = (int(114981 / RATIO), int(58529 / RATIO))
COLS = 1
TILE_SIZE = RASTER_SIZE[0] / COLS
X_GUTTER = 1.00

# font size, line width resize factor
RESIZE_FACTOR = 10 / RATIO

srs = "+proj=natearth +wkttext"

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

for s in xmldoc.getElementsByTagName('Map'):
    s.setAttribute('srs', srs)

for s in xmldoc.getElementsByTagName('Layer'):
    s.setAttribute('srs', srs)

raster = xmldoc.getElementsByTagName('Layer')[0]
raster_url = raster.getElementsByTagName('Parameter')[0].firstChild
raster_url.data = raster_url.data.replace('data/map_mercator_light.tif', 'layers/map_natearth_compressed_small.tif')

f = file("worldmap_resized.xml", "w+b")
print "Writing resized mapfile"
xmldoc.writexml(f)
f.close()
os.remove(worldmap_path)

print "Generating image"
subprocess.call("node export.js", shell=True)

print "Done ! Now you can launch the following command: 'cd export && gdal_merge.py -o worldmap.tif -co COMPRESS=DEFLATE -co TILED=YES worldmap_*.tif'."
print "It may take a while."
print "Then convert it to PDF : 'gdal_translate worldmap.tif worldmap.pdf'."
print "To split the file into small pieces to be printed on A4 sheets, use the folllowing:"
print "gdal_retile.py -ps 2480 3508 worldmap.tif -targetDir tmp"
