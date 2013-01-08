@futura_med: "Futura Medium","Function Pro Medium","Ubuntu Regular","Trebuchet MS Regular","DejaVu Sans Book";
@futura_italic: "Futura Medium Italic","Function Pro Medium Italic","Ubuntu Italic","Trebuchet MS Italic","DejaVu Sans Oblique";
@futura_bold: "Futura Bold","Function Pro Bold","Ubuntu Bold","Trebuchet MS Bold","DejaVu Sans Bold";

@sans:"Droid Sans Book","Arial Regular","DejaVu Sans Book";
@sans_bold:"Droid Sans Bold","Arial Bold","DejaVu Sans Bold";
@sans_bold_italic:  "Open Sans Bold Italic","DejaVu Sans Bold Italic","unifont Medium";
@sans_italic:  "Open Sans Italic","DejaVu Sans Italic","unifont Medium";

/* ---- Countries ---- */
#countries_label {
  text-face-name: @futura_med;
  text-fill: #333;
  text-size:15;
  text-halo-fill: @countries;
  text-halo-radius:1.5;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[NAME]";
  text-placements:"N,S,W,E,NE,SW,16,13";
  text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
  text-clip: false;
}

#states {
  [NAME_0='United States of America'] {
  text-face-name: @futura_med;
  text-fill: #777;
  text-size:15;
  text-halo-fill: @countries;
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:30;
  text-name: "[NAME_1]";
  text-placements:"N,S,W,E,NE,SW,13,11";
  text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
  text-clip: false;
    }
}

#cities_labels {
  [SCALERANK<3],
  [SCALERANK=3],
  [SCALERANK=4],
  [SCALERANK=5],
  [SCALERANK=6],
  [SCALERANK=7] {
    text-name:'[NAMEASCII]';
    text-face-name:@sans;
    text-fill: rgba(50, 50, 50, 0.8);
    text-halo-fill:rgba(255,255,255,0.7);
    text-halo-radius:1;
    text-line-spacing:1;
    text-placements: "NE,E,S,W,N,SE,NW,SW";
    text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
  [FEATURECLA="Admin-0 capital"] {
    text-fill: rgba(50, 50, 50, 1);
    text-halo-fill: rgba(255,255,160,0.7);
    text-halo-radius: 1.5;
    }
  text-clip: false;
  }
    [SCALERANK<3],
    [SCALERANK=3] {
      text-size: 11;
    }
    [SCALERANK=4],
    [SCALERANK=5] {
      text-size: 10;
    }
    [SCALERANK=6] { 
      text-size: 9;
    }
    [SCALERANK=7] { 
      text-size: 8;
    }
}

#peaks {
  [Name!=''][ScaleRank<=7] {
    text-name:"[Name] + '\n(' + [Elevation] + ' m)'";
    text-face-name:@futura_italic;
    text-fill: white;
    text-size:9;
    text-halo-fill:rgba(60, 60, 60,0.7);
    text-halo-radius:1;
    text-line-spacing:1;
    text-placements: "W,NW,S,E,NE,N,SE,SW";
    text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
  }
}

#waterbodieslnlabels {
  text-face-name: @sans;
  text-fill: rgba(255, 255, 255, 0.7);
  text-halo-fill: rgba(0, 130, 255, 0.3);
  text-halo-radius:1.5;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[name_fr]";
  text-placement: line;
  text-size:16;
  text-clip: false;
}
#waterbodiesptlabels {
  text-face-name: @futura_italic;
  text-fill: rgba(255, 255, 255, 0.7);
  text-halo-fill: rgba(0, 130, 255, 0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[name_fr]";
  text-avoid-edges: true;
  text-size:14;
  [scale_rank=0] {
    text-size: 26;
  }
  [scale_rank=1] {
    text-size: 16;
  }
  text-clip: false;
}

#geographiclineslabel {
    text-size: 16;
  text-face-name: @sans_bold;
  text-fill: @orange;
  text-halo-fill:rgba(255,255,255,0.5);
  text-halo-radius:1;
  text-wrap-width:60;
  text-name: "[NAME_FR]";
}

#rivers_labels {
  text-face-name: @sans_bold;
  text-fill: #70b1ef;
  text-halo-fill: rgba(255,255,255,0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[NAME]";
  text-placement: line;
  text-size:9;
  text-clip: false;
}