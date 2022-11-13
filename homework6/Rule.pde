class Rule {
  char a;   //前身
  String b; //继任者

  Rule(char a_, String b_) {
    a = a_;
    b = b_; 
  }

  char getA() {
    return a;
  }

  String getB() {
    return b;
  }

}
