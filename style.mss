
@water:             #73b8f5;
@orange:            #f36b35;
@countries:         rgba(180, 220, 255,0.5);

Map {
  background-color: white;
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
    [SCALERANK=4] {
      marker-width:4;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
      marker-width: 10;
    }
    /*
    [SCALERANK=6] {
      marker-width:3;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
    }
    */
    /*
    [SCALERANK=7] {
      marker-width:2;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
    }
    */
  }
}

#10murbanareas {
  line-color:#ba8445;
  line-width:0.5;
  line-opacity: 0.4;
  polygon-opacity:0.2;
  polygon-fill:#ba8445;
}
#peaks {
  [Name!=''][ScaleRank<=7] {
    point-file: url(symbols/peak.svg);
      point-transform: "scale(0.04)";
    [Elevation>7000] {
    point-transform: "scale(0.045)";
      }
    [Elevation=8848] {
    point-transform: "scale(0.06)";
      }
  }
}


#10madmin0boundarylin {
  line-width:3;
  line-color: @countries;
}

#10madmin0boundarylin::glow {
  line-width:1.5;
  line-dasharray: 3,4;
  line-color:grey;
}

#10madmin1statesprovi {
  [COUNTRYNAM='United States of America'] {
  line-width:0.7;
  line-dasharray: 3,3;
  line-color:grey;
    }
}

#10mgraticules10 {
    line-width: 0.5;
    line-color: #458;
    line-opacity: 0.5;
}
#10mgraticules30 {
  line-width:1;
  line-color: #458;
    line-opacity: 0.5;
}

#geographiclines {
    [FeatureCla!='Date line'] {
    line-width: 1;
    line-color: @orange;
    }
}