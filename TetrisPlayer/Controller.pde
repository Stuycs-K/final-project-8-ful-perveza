class Controller {
  static final int P1_LEFT = 0;
  static final int P1_RIGHT = 1;
  static final int P1_DOWN = 2;
  boolean [] inputs;

  public Controller() {
    inputs = new boolean[3];//3 valid buttons
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
  }
  void release(int code) {
    if(code == LEFT)
      inputs[P1_LEFT] = false;
    if(code == RIGHT)
      inputs[P1_RIGHT] = false;
    if(code == DOWN)
      inputs[P1_DOWN] = false;
  }
}
