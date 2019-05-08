class Button { //<>//
  // Member variables
  int x, y, w, h;
  int val;
  String op;
  boolean hov, asOp;
  PFont font, font2, font3, font4;

  // Multiple constructors for numbers and other buttons
  Button(int x, int y, int w, int h, int val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    hov = false;
    font = createFont("Helvetica-Bold", 72);
    font2 = createFont("Helvetica-Bold", 48);
    font3 = createFont("Helvetica-Bold", 60);
    font4 = createFont("Helvetica-Bold", 36);
  }

  Button asOperator(String op) {
    this.op = op;
    asOp = true;
    return this;
  }

  // Display Method
  void display() {
    if (asOp && op == "x²") {
      if (hov) {
        fill(#54FF3B);
      } else {
        fill(255);
      }
      textFont(font2);
      rect(x, y, w, h, 10);
      fill(0);
      textAlign(CENTER, CENTER);
      text(op, x+w/2, y+h/2);
    } else if (asOp && op == "sin()" || asOp && op == "cos()") {
      if (hov) {
        fill(#54FF3B);
      } else {
        fill(255);
      }
      textFont(font4);
      rect(x, y, w, h, 10);
      fill(0);
      textAlign(CENTER, CENTER);
      text(op, x+w/2, y+h/2);
    } else if (asOp && op == "√") {
      if (hov) {
        fill(#54FF3B);
      } else {
        fill(255);
      }
      textFont(font2);
      rect(x, y, w, h, 10);
      fill(0);
      textAlign(CENTER, CENTER);
      text(op, x+w/2, y+h/2);
    } else if (asOp) {
      if (hov) {
        fill(#54FF3B);
      } else {
        fill(255);
      }
      textFont(font);
      rect(x, y, w, h, 10);
      fill(0);
      textAlign(CENTER, CENTER);
      text(op, x+w/2, y+h*0.4);
    } else {
      if (hov) {
        fill(#54FF3B);
      } else {
        fill(255);
      }
      textFont(font);
      rect(x, y, w, h, 10);
      fill(0);
      textAlign(CENTER, CENTER);
      text(val, x+w/2, y+h/2);
    }
  }

  // Rollover Method
  void hoverMethod() {
    hov = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
}
