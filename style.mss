Map {
  background-color: #b8dee6;
}

#countries {
  /*
  ::outline {
    line-color: #555;
    line-width: 2;
    line-join: round;
  }
  */
  polygon-fill: #fff;
}

#cities {
  [zoom=7] {
    [SCALERANK<3],
    [SCALERANK=3],
    [SCALERANK=4],
    [SCALERANK=5] {
      marker-width:3;
      marker-fill:#ccc;
      marker-line-color:#999;
      marker-allow-overlap: true;
    }
    [SCALERANK=6] {
      marker-width:2;
      marker-fill:#ccc;
      marker-line-color:#999;
      marker-allow-overlap: true;
    }
  }
}


#10madmin0boundarylin {
  line-width:1;
  line-color:#168;
}
