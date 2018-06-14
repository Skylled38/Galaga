void gui() {
  background(255);
  
  //tour
  fill(255);
  if (focused) {
    stroke(0);
  } else {
    stroke(210);
  }
  rect(0, 0, width-1, height-1);

  int couleur;
  if (focused) {
    if (!move) {
      couleur = #2196f3;
    } else {
      couleur = #2fafff;
    }
  } else {
    couleur = 210;
  }


  //ruban
  stroke(couleur);
  fill(couleur);
  rect(0, 25, width, 25);
}
