@futura_med: "Futura Medium","Function Pro Medium","Ubuntu Regular","Trebuchet MS Regular","DejaVu Sans Book";
@futura_italic: "Futura Medium Italic","Function Pro Medium Italic","Ubuntu Italic","Trebuchet MS Italic","DejaVu Sans Oblique";
@futura_bold: "Futura Bold","Function Pro Bold","Ubuntu Bold","Trebuchet MS Bold","DejaVu Sans Bold";

@sans:"Droid Sans Book","Arial Regular","DejaVu Sans Book";
@sans_bold:"Droid Sans Bold","Arial Bold","DejaVu Sans Bold";

/* ---- Countries ---- */
#countries_label {
  text-face-name: @futura_med;
  text-fill: #333;
  text-size:16;
  text-halo-fill:rgba(255,255,255,0.5);
  text-halo-radius:3;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[NAME]";
  text-placements:"N,S,W,E,NE,SW,15,12,10,8";
  text-placement-type:simple;
    text-dx: 3;
    text-dy: 3;
}
/*
#cities_label {
  text-face-name: @futura_med;
  text-fill: #999;
  text-size:10;
  text-halo-fill:rgba(255,255,255,0.5);
  text-halo-radius:1;
  text-line-spacing:1;
  text-wrap-width:20;
  text-name: "[NAME]";
  text-placements:"N,S,W,E,NE,SW,15,12,10,8";
  text-placement-type:simple;
}
*/

#cities {
  [SCALERANK<3][zoom>=4],
  [SCALERANK=3][zoom>=5],
  [SCALERANK=4][zoom>=5],
  [SCALERANK=5][zoom>=6],
  [SCALERANK=6][zoom>=6] {
    text-name:'[NAMEASCII]';
    text-face-name:@sans_bold;
    text-fill: #555;
    text-size:9;
    text-halo-fill:rgba(255,255,255,0.5);
    text-halo-radius:2;
    text-line-spacing:1;
    text-placements: "E,NE,S,W,N,SE,NW,SW";
    text-placement-type:simple;
    text-dx: 4;
    text-dy: 4;
  }
  [zoom=7] {
    [SCALERANK<3],
    [SCALERANK=3] {
      text-size: 13;
    }
    [SCALERANK=4],
    [SCALERANK=5] {
      text-size: 12;
    }
    [SCALERANK=6] { 
      text-size: 10;
    }
  }
}