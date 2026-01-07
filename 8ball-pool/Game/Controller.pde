class Controller {
  static final int enter = 0;
  static final int zero = 5;
  boolean[] inputs;

  public Controller() {
    inputs = new boolean[6];
  }

  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if (code == ENTER) {
      inputs[enter] = true;
    } else if (code == '1') {
      inputs[1] = true;
    } else if (code == '2') {
      inputs[2] = true;
    } else if (code == '3'){
      inputs[3] = true;
    } else if (code == '4'){
      inputs[4] = true;
    } else if (code == '0'){
      inputs[5] = true;
    }
  }

  void release(int code) {
    if (code == ENTER) {
      inputs[enter] = false;
    } else if (code == '1') {
      inputs[1] = false;
    } else if (code == '2') {
      inputs[2] = false;
    } else if (code == '3'){
      inputs[3] = false;
    } else if (code == '4'){
      inputs[4] = false;
    } else if (code == '0'){
      inputs[5] = false;
    }
  }
}
