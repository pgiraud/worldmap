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
  text-size:14;
  text-halo-fill: @countries;
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[NAME]";
  text-placements:"N,S,W,E,NE,SW,15,12,10,8";
  text-placement-type:simple;
    text-dx: 3;
    text-dy: 3;
}

#cities {
  [SCALERANK<3],
  [SCALERANK=3],
  [SCALERANK=4],
  [SCALERANK=5],
  [SCALERANK=6],
  [SCALERANK=7] {
    text-name:'[NAMEASCII]';
    text-face-name:@sans;
    text-fill: rgba(50, 50, 50, 0.7);
    text-halo-fill:rgba(255,255,255,0.5);
    text-halo-radius:1;
    text-line-spacing:1;
    text-placements: "NE,E,S,W,N,SE,NW,SW";
    text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
  [FEATURECLA="Admin-0 capital"] {
    text-fill: rgba(50, 50, 50, 1);
    text-halo-fill: rgba(255,255,160,0.5);
    }
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
    text-size:8;
    text-halo-fill:rgba(60, 60, 60,0.5);
    text-halo-radius:1;
    text-line-spacing:1;
    text-placements: "E,NE,S,W,N,SE,NW,SW";
    text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
  }
}

#waterbodieslnlabels {
  text-face-name: @sans;
  text-fill: rgba(255, 255, 255, 0.7);
  text-halo-fill: rgba(0, 130, 255, 0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[name_fr]";
  text-placement: line;
  text-avoid-edges: true;
  text-size:14;
}

#geographiclines {
  [ScaleRank<100] {
  text-face-name: @sans_bold;
  text-fill: @orange;
  text-halo-fill:rgba(255,255,255,0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[Name_FR]";
  text-placement: line;
  text-avoid-edges: true;
  }
}