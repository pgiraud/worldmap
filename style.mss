
@water:             #72b7f4;


Map {
  background-color: #FFF;
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

#cities {
  [zoom=6] {
    [SCALERANK<3],
    [SCALERANK=3],
    [SCALERANK=4],
    [SCALERANK=5] {
      marker-width:3;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
    }
    [SCALERANK=6] {
      marker-width:2;
      marker-fill:#999;
      marker-line-color:#555;
      marker-allow-overlap: true;
    }
  }
}


#10madmin0boundarylin {
  line-width:1;
  line-color:#168;
}

#geotiff {
  raster-opacity:1;
  raster-scaling: bilinear;
}

#10murbanareas {
  line-color:#999;
  line-width:0.5;
  polygon-opacity:0.5;
  polygon-fill:#999;
}


#10mlakes {
  line-color:@water;
  line-width:0.5;
  polygon-opacity:1;
  polygon-fill:@water;
}


#10mriverslakecenterl {
  line-width:1;
  line-color:@water;
}

#10mgeographyregionse {
  [ScaleRank<=5] {
    marker-width:6;
    marker-fill:#f45;
    marker-line-color:#813;
    marker-allow-overlap:true;
  }
}
