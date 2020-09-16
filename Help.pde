boolean optShowHelp = false;

void drawHelp() {
  String helpText =
    "1-4: Elements drawn [current: " + num + "]\n"
    + "S: Toggle spheres [enabled: " + optDrawSpheres + "]\n"
    + "L: Toggle lines [enabled: " + optDrawLines + "]\n"
    + "P: Print screenshot\n"
    + "H: Show help\n";
    
  noStroke();
  fill((angle*100+192)%255, 255, 255, 255);
  rect(5, 5, 195, 80);

  blendMode(BLEND);
  fill(0, 0, 0, 255);
  text(helpText, 10, 20);
}
