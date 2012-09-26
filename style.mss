
@water:             #73b8f5;
@orange:            #f36026;
@countries:         rgba(180, 220, 255,0.5);

Map {
  background-color: white;
}

#countries {
  /*
  ::outline {
    line-color: #555;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #fff;
  */
}

#raster {
  raster-scaling: bilinear;
}

#cities {
  //[zoom=6] {
  
    [FEATURECLA="Admin-0 capital"] {
      point-file: url(symbols/star3.svg);
      point-transform: "scale(0.03)";
      point-allow-overlap: true;
    }
  [FEATURECLA!="Admin-0 capital"] {
    [SCALERANK<3],
    [SCALERANK=3],
    [SCALERANK=4],
    [SCALERANK=5] {
      marker-width:4;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
      marker-width: 10;
    }
    [SCALERANK=6] {
      marker-width:3;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
    }
    [SCALERANK=7] {
      marker-width:2;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
    }
  }
}


#10murbanareas {
  line-color:#999;
  line-width:0.5;
  line-opacity: 0.3;
  polygon-opacity:0.1;
  polygon-fill:#999;
}

#peaks {
  [Name!=''][ScaleRank<=7] {
    point-file: url(symbols/peak4.svg);
    point-transform: "scale(0.03)";
  }
}


#10madmin0boundarylin {
  line-width:3;
  line-color: @countries;
}

#10madmin0boundarylin::glow {
  line-width:1;
  line-dasharray: 4,2;
  line-color:grey;
}


#10mbathymetry {
  polygon-fill: rgb(16,12,4);
  polygon-comp-op: minus;
}

#10mgraticules10 {
  [direction=''],
  [direction='W'],
  [direction='E'] {
    line-width: 1;
    line-color: #458;
    line-opacity: 0.5;
  }
}

/*
#geographiclines {
  [ScaleRank<100] {
  line-width:4;
  line-color: white;
  line-opacity: 0.5;
  }
}
*/
#geographiclines::glow {
  [ScaleRank<100] {
    line-width: 0.5;
    line-color: @orange;
    [FeatureCla='Date line'] {
      line-dasharray: 6, 2;
    }
  }
}


#10mgeographyregionsp {
  line-color:#594;
  line-width:0.5;
  polygon-opacity:1;
  polygon-fill:#ae8;
}

#geograph_points {
  marker-width:6;
  marker-fill:#f45;
  marker-line-color:#813;
  marker-allow-overlap:true;
}

#10mland {
  polygon-opacity:1;
  polygon-fill:#ae8;
  polygon-gamma: 0.2;
  polygon-gamma-method: threshold;
}