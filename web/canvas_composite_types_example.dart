import 'dart:html';
import 'dart:math';
void main() {
  var compositeTypes = ['source-over', 'source-in', 'source-out', 'source-atop',
                        'destination-over', 'destination-in', 'destination-out',
                        'destination-atop', 'lighter', 'darker', 'copy','xor'];

  var wrapper = query("#wrapper");
  compositeTypes.forEach((String compositeType) {
    var canvas = new CanvasElement(width: 125, height: 125);
    var ctx = canvas.context2d;
    // draw rectangle
    ctx.fillStyle = "#09f";
    ctx.fillRect(15, 15, 70, 70);
    // set composite property
    ctx.globalCompositeOperation = compositeType;
    
    // draw circle
    ctx.fillStyle = "#f30";
    ctx.beginPath();
    ctx.arc(75, 75, 35, 0, PI*2, true);
    ctx.fill();
    wrapper.elements.add(canvas);
  });
  
  wrapper.elements[wrapper.elements.length - 1].classes.add("last");
  
  new HttpRequest.get("web/canvas_composite_types_example.dart", 
      (HttpRequest request) { 
    query("#code").innerHTML = request.responseText;
  });
  
}
