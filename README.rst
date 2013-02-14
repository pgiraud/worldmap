This is a TileMill project for a worldmap with french inside.

Prerequisites
=============

TileMill
Mapnik pyton bindings

Workflow
========

Once TileMill is installed.
Clone this repo in the projects directory of TileMill (MapBox).

Launch TileMill, and chose the `worldmap` project.

Control that everything displays correctly.

Export the project as `.xml` mapnik map file right in the worldmap project
directory.

In a terminal, change directory to the worldmap directory, and type the
following command::

    python worldmap.py

This will create several files in the export directory.



Reprojection of the tif generated with mapbox tiles::

    gdalwarp -t_srs '+proj=natearth +wktext' -s_srs EPSG:4326 map_4326.tif map_natearth.tif
    http://lists.osgeo.org/pipermail/gdal-dev/2012-September/034036.html
composite  -compose atop -geometry +0+19000 symbols/copyright.png export/worldmap_17.tif  export/worldmap_17.tif
