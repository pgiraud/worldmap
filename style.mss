
@water:             #73b8f5;
@orange:            #f36b35;
@countries:         rgba(180, 220, 255,0.5);
//@urban:             #ba8445;
@urban:             #555;

Map {
  background-color: white;
}

#raster {
  raster-scaling: bilinear;
}

#cities {
  //[zoom=6] {
    [featurecla="Admin-0 capital"] {
      point-file: url(symbols/star3.svg);
      point-transform: "scale(0.03)";
      point-allow-overlap: true;
    }
}

#10murbanareas {
  polygon-opacity:0.2;
  polygon-fill:@urban;
  line-width: 0.3;
  line-opacity: 0.5;
  line-color: @urban;
}
#peaks {
  [name!=''][scalerank<=7] {
    point-file: url(symbols/peak.svg);
      point-transform: "scale(0.04)";
    [elevation>7000] {
    point-transform: "scale(0.045)";
      }
    [elevation=8848] {
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
//  line-dasharray: 3,4;
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


#countrieslabelleader::glow {
  line-color: white;
  line-opacity: 0.2;
  line-width: 3;
}

#countrieslabelleader {
  line-dasharray: 5, 5;
  line-width: 0.6;
}