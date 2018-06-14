String enteredText = "";

void editText() {
  if (keyCode != 0) {
    if (enteredText == "") {
      enteredText = str(key);
    } else {
      if (keyCode == 8) {
        if (enteredText.length()>0) {
          enteredText = enteredText.substring(0, enteredText.length()-1);
        } else {
          enteredText = "";
        }
      } else {
        enteredText += key;
      }
    }
    keyCode = 0;
  }
}
