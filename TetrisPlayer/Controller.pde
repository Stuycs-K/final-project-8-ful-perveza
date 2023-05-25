class Controller {
  static final int P1_LEFT = 0;
  static final int P1_RIGHT = 1;
  static final int P1_DOWN = 2;
  static final int P1_RLEFT = 3;
  static final int P1_RRIGHT = 4;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[5];//5 valid buttons
  }

  /**@param code: a valid constant e.g. P1_LEFT
  */
  boolean isPressed(int code) {
    return inputs[code];
  }

  void press(int code) {
    if(code == LEFT)
      inputs[P1_LEFT] = true;
    if(code == RIGHT)
      inputs[P1_RIGHT] = true;
    if(code == DOWN)
      inputs[P1_DOWN] = true;
    if(code == 'Z')
      inputs[P1_RLEFT] = true;
    if(code == 'X')
      inputs[P1_RRIGHT] = true;
  }
  void release(int code) {
    if(code == LEFT)
      inputs[P1_LEFT] = false;
    if(code == RIGHT)
      inputs[P1_RIGHT] = false;
    if(code == DOWN)
      inputs[P1_DOWN] = false;
    if(code == 'Z')
      inputs[P1_RLEFT] = false;
    if(code == 'X')
      inputs[P1_RRIGHT] = false;
  }
}
