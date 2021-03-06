@futura_med: "Futura Medium","Trebuchet MS Regular";
@futura_italic: "Futura Medium Italic","Trebuchet MS Italic";
@futura_bold: "Futura Bold","Trebuchet MS Bold";

@droid_serif: "Droid Serif Regular";
@droid_serif_bold: "Droid Serif Bold";
@droid_serif_italic: "Droid Serif Italic";
@yanone_bold: "Yanone Kaffeesatz Bold";
@yanone: "Yanone Kaffeesatz Regular";


/* ---- Countries ---- */
#countries_label {
  [ID!=40]
  [ID!=187]
  [ID!=188]
  [ID!=189]
  [ID!=193]
  [ID!=195]
  [ID!=213]
  [ID!=215] 
  [ID!=217]
  [ID!=230] {
    text-face-name: @droid_serif;
    text-fill: #333;
    text-size:15;
    text-halo-radius: 2;
    text-halo-comp-op: plus;
    text-line-spacing:1;
    text-name: "[NAME]";
    text-placement-type:simple;
    text-clip: false;
    
    [PLACEMENT='N'] {
      text-placements:"N";
    }
    [PLACEMENT='NE'] {
      text-placements:"NE";
    }
    [PLACEMENT='E'] {
      text-placements:"E";
    }
    [PLACEMENT='SE'] {
      text-placements:"SE";
    }
    [PLACEMENT='S'] {
      text-placements:"S";
    }
    [PLACEMENT='SW'] {
      text-placements:"SW";
    }
    [PLACEMENT='W'] {
      text-placements:"W";
    }
    [PLACEMENT='NW'] {
      text-placements:"NW";
    }
    [PLACEMENT!=''] {
      text-dx: 4;
      text-dy: 4;
      }
    [PLACEMENT=''] {
      text-size: 17;
      text-wrap-width:200;
      text-placement-type: simple;
      text-horizontal-alignment: middle;
      text-vertical-alignment: middle;
      text-placements:"N, E, W, S, NW";
    }
  }
}

#10madmin1statesprovi2 {
  [NAME_0='United States of America'] {
    text-face-name: @droid_serif;
    text-fill: #666;
    text-halo-comp-op: plus;
    text-halo-radius: 1.5;
    text-size:11.5;
    text-halo-fill: @countries;
    text-halo-radius:1;
    text-line-spacing:1;
    text-wrap-width:30;
    text-name: "[NAME_1]";
    text-placements:"N,S,W,E,NE,SW";
    text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
    text-clip: false;
  }
}

#capitals_labels {
  ["name_fr"!=''] {
    text-name:'[name_fr]';
  }
  text-name:'[name]';
    text-face-name:@droid_serif_bold;
//    text-fill: #535353;
    text-fill: rgba(255, 255, 255, 1);
//    text-fill: rgba(50, 50, 50, 1);
    text-halo-fill:rgba(80, 80, 80, 0.6);
//    text-halo-fill:rgba(255,255,255,0.7);
    text-halo-radius:1.4;
    text-placement-type:simple;
    text-placements: "NE,NW,SE,SW,E,W";
    text-line-spacing:1;
    text-dx: 4;
    text-dy: 4;
    text-size: 12.5;
    text-clip: false;
}

#peaks {
  [name!=''][scalerank<=7] {
    text-name:"[name] + '\n' + [elevation] + ' m'";
    text-face-name:@droid_serif_italic;
    text-size: 11;
    text-fill: rgba(50, 50, 50, 1);
    text-halo-fill:rgba(220,255,192,0.7);
    text-halo-radius:1.3;
    text-placements: "E,W,NW,S,NE,N,SE,SW";
    text-placement-type:simple;
    text-dx: 7;
    text-dy: 7;
    [elevation>7000] {
      text-size: 11.5;
    }
    [elevation=8848] {
      text-size: 13;
      text-dx: 6;
      text-dy: 6;
    }
  }
}

#waterbodieslnlabels {
  text-face-name: @droid_serif_italic;
  text-fill: rgba(255, 255, 255, 0.7);
  text-halo-fill: rgba(0, 130, 255, 0.3);
  text-halo-radius:1.5;
  text-line-spacing:1;
  text-wrap-width:200;
  text-name: "[name_fr]";
  text-placement: line;
  text-size:15;
  text-clip: false;
}
#waterbodiesptlabels {
  text-face-name: @droid_serif_italic;
  text-fill: rgba(255, 255, 255, 0.7);
  text-halo-fill: rgba(0, 130, 255, 0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[name_fr]";
  text-avoid-edges: true;
  text-size:18;
  [scale_rank=0] {
    text-size: 40;
  }
  [scale_rank=1] {
    text-size: 15;
  }
  text-clip: false;
}

#geographiclineslabel {
  text-size: 20;
  text-dy: 5;
  text-face-name: @droid_serif_italic;
  text-fill: rgba(255,255,255, 1);
  text-halo-fill: @orange;
  text-halo-radius:1;
  text-name: "[NAME_FR]";
}

#rivers_label {
  text-face-name: @droid_serif_italic;
  text-fill: #70b1ef;
  text-halo-fill: rgba(255,255,255,0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:140;
  text-name: "[NAME]";
  text-placement: line;
  text-size:11;
  text-clip: false;
}