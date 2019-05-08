Button[] num = new Button[10];
Button[] ops = new Button[12];
String displayVal, leftVal, rightVal;
char opVal;
boolean firstNum, dec;
float result;
PFont resultFont, resultFont2, resultFont3, resultFont4;

void setup() {
  size(500, 500);
  displayVal = "";
  leftVal = "";
  rightVal = "";
  opVal = ' ';
  result = 0.0;
  dec = false;
  firstNum = true;
  num[0] = new Button(0, 336, 78, 164, 0);
  num[1] = new Button(82, 420, 100, 80, 1);
  num[2] = new Button(186, 420, 100, 80, 2);
  num[3] = new Button(290, 420, 100, 80, 3);
  num[4] = new Button(82, 336, 100, 80, 4);
  num[5] = new Button(186, 336, 100, 80, 5);
  num[6] = new Button(290, 336, 100, 80, 6);
  num[7] = new Button(82, 252, 100, 80, 7);
  num[8] = new Button(186, 252, 100, 80, 8);
  num[9] = new Button(290, 252, 100, 80, 9);

  ops[0] = new Button(394, 420, 100, 80, 0).asOperator("+");
  ops[1] = new Button(394, 336, 100, 80, 0).asOperator("−");
  ops[2] = new Button(394, 252, 100, 80, 0).asOperator("×");
  ops[3] = new Button(394, 164, 100, 80, 0).asOperator("÷");
  ops[4] = new Button(290, 164, 100, 80, 0).asOperator("±");
  ops[5] = new Button(186, 164, 100, 80, 0).asOperator(".");
  ops[6] = new Button(0, 164, 182, 80, 0).asOperator("Clear");
  ops[7] = new Button(5, 20, 100, 80, 0).asOperator("=");
  ops[8] = new Button(0, 252, 78, 80, 0).asOperator("√");
  ops[9] = new Button(186, 118, 100, 40, 0).asOperator("x²");
  ops[10] = new Button(290, 118, 100, 40, 0).asOperator("sin()");
  ops[11] = new Button(394, 118, 100, 40, 0).asOperator("cos()");
  resultFont = createFont("Helvetica-Bold", 72);
  resultFont2 = createFont("Helvetica-Bold", 48);
  resultFont3 = createFont("Helvetica-Bold", 36);
  resultFont4 = createFont("Helvetica-Bold", 28);
}

void draw() {
  background(127);
  resultDisplay();
  for (int i=0; i<num.length; i++) {
    num[i].display();
    num[i].hoverMethod();
  }
  for (int i=0; i<ops.length; i++) {
    ops[i].display();
    ops[i].hoverMethod();
  }
}

void resultDisplay() {
  fill(255);
  rect(0, 4, 500, 110, 10);
  fill(0);
  textAlign(RIGHT);
  if (displayVal.length() > 17) {
    textFont(resultFont4);
  } else if (displayVal.length() > 13) {
    textFont(resultFont3);
  } else if (displayVal.length() > 9) {
    textFont(resultFont2);
  } else {
    textFont(resultFont);
  }
  text(displayVal, 450, 80);
}

void mouseReleased() {
  for (int i=0; i<num.length; i++) {
    if (num[i].hov) {
      if (firstNum) {
        leftVal += str(num[i].val);
        displayVal = leftVal;
      } else {
        rightVal += str(num[i].val);
        displayVal = rightVal;
      }
    }
  }
  for (int i=0; i<ops.length; i++) {
    if (ops[i].hov) {
      if (ops[i].op == "+") {
        opVal = '+';
        firstNum = false;
        dec = false;
      } else if (ops[i].op == "=") {
        performCalc();
      } else if (ops[i].op == "−") {
        opVal = '−';
        firstNum = false;
        dec = false;
      } else if (ops[i].op == "×") {
        opVal = '×';
        firstNum = false;
        dec = false;
      } else if (ops[i].op == "÷") {
        opVal = '÷';
        firstNum = false;
        dec = false;
      } else if (ops[i].op == "Clear") {
        firstNum = true;
        dec = false;
        leftVal = "";
        rightVal = "";
        result = 0.0;
        displayVal = "";
      } else if (ops[i].op == "±") {
        if (firstNum) {
          leftVal = str(float(leftVal) * -1);
          displayVal = leftVal;
        } else {
          rightVal = str(float(rightVal) * -1);
          displayVal = rightVal;
        }
      } else if (ops[i].op == "√") {
        if (firstNum) {
          leftVal = str(sqrt(float(leftVal)));
          displayVal = leftVal;
        } else {
          rightVal =  str(sqrt(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (ops[i].op == "x²") {
        if (firstNum) {
          leftVal = str(sq(float(leftVal)));
          displayVal = leftVal;
        } else {
          rightVal =  str(sq(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (ops[i].op == "sin()") {
        if (firstNum) {
          leftVal = str(sin(float(leftVal)));
          displayVal = leftVal;
        } else {
          rightVal =  str(sin(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (ops[i].op == "cos()") {
        if (firstNum) {
          leftVal = str(cos(float(leftVal)));
          displayVal = leftVal;
        } else {
          rightVal =  str(cos(float(rightVal)));
          displayVal = rightVal;
        }
      } else if (!dec) {
        if (ops[i].op == ".") {
          if (firstNum) {
            leftVal = leftVal + ".";
            displayVal = leftVal;
            dec = true;
          } else {
            rightVal = rightVal + ".";
            displayVal = rightVal;
            dec = true;
          }
        }
      }
    }
  }
}

void performCalc() {
  if (opVal == '+') {
    result = float(leftVal) + float(rightVal);
    displayVal = str(result);
  } else if (opVal == '−') {
    result = float(leftVal) - float(rightVal);
    displayVal = str(result);
  } else if (opVal == '×') {
    result = float(leftVal) * float(rightVal);
    displayVal = str(result);
  } else if (opVal == '÷') {
    result = float(leftVal) / float(rightVal);
    displayVal = str(result);
  } 
  leftVal = displayVal;
  firstNum = true;
}

void keyReleased() {
  if (firstNum) {
    if (key == '0') {
      leftVal += 0;
      displayVal = leftVal;
    } else if (key == '1') {
      leftVal += 1;
      displayVal = leftVal;
    } else if (key == '2') {
      leftVal += 2;
      displayVal = leftVal;
    } else if (key == '3') {
      leftVal += 3;
      displayVal = leftVal;
    } else if (key == '4') {
      leftVal += 4;
      displayVal = leftVal;
    } else if (key == '5') {
      leftVal += 5;
      displayVal = leftVal;
    } else if (key == '6') {
      leftVal += 6;
      displayVal = leftVal;
    } else if (key == '7') {
      leftVal += 7;
      displayVal = leftVal;
    } else if (key == '8') {
      leftVal += 8;
      displayVal = leftVal;
    } else if (key == '9') {
      leftVal += 9;
      displayVal = leftVal;
    } else if (key == '+') {
      opVal = '+';
      firstNum = false;
      dec = false;
    } else if (key == '-') {
      opVal = '−';
      firstNum = false;
      dec = false;
    } else if (key == '*') {
      opVal = '×';
      firstNum = false;
      dec = false;
    } else if (key == '/') {
      opVal = '÷';
      firstNum = false;
      dec = false;
    } else if (!dec) {
      if (key == '.') {
        leftVal = leftVal + ".";
        displayVal = leftVal;
        dec = true;
      }
    }
  } else {
    if (key == '0') {
      rightVal += 0;
      displayVal = rightVal;
    } else if (key == '1') {
      rightVal += 1;
      displayVal = rightVal;
    } else if (key == '2') {
      rightVal += 2;
      displayVal = rightVal;
    } else if (key == '3') {
      rightVal += 3;
      displayVal = rightVal;
    } else if (key == '4') {
      rightVal += 4;
      displayVal = rightVal;
    } else if (key == '5') {
      rightVal += 5;
      displayVal = rightVal;
    } else if (key == '6') {
      rightVal += 6;
      displayVal = rightVal;
    } else if (key == '7') {
      rightVal += 7;
      displayVal = rightVal;
    } else if (key == '8') {
      rightVal += 8;
      displayVal = rightVal;
    } else if (key == '9') {
      rightVal += 9;
      displayVal = rightVal;
    } else if (key == '.') {
      rightVal = rightVal + ".";
      displayVal = rightVal;
      dec = true;
    }
  }
  if (key == ENTER) {
    performCalc();
  } else if (key == BACKSPACE || key == DELETE) {
    firstNum = true;
    dec = false;
    leftVal = "";
    rightVal = "";
    result = 0.0;
    displayVal = "";
  }
}
