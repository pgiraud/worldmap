#! /bin/bash

for i in `ls data/*.shp`
do
    file=$(basename $i .shp)
    echo Transforming $file
    if [ ! -f "/tmp/$file.shp" ]; then
        ogr2ogr -t_srs 'LOCAL_CS["foo", EXTENSION["PROJ4", "+proj=natearth +wktext"]]' -overwrite /tmp/$file.shp $i
    fi
done

for i in `ls layers/*/*.shp`
do
    file=$(basename $i .shp)
    echo Transforming $file
    if [ ! -f "/tmp/$file.shp" ]; then
        ogr2ogr -t_srs 'LOCAL_CS["foo", EXTENSION["PROJ4", "+proj=natearth +wktext"]]' -overwrite /tmp/$file.shp $i
    fi
done
