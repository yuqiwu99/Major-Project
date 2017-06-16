class Timer {
  //data/variables
  int startTime, amountOfTimeToWait, endTime;
  boolean timerIsDone;

  //contructors
  Timer(float secondsToWait) {
    reset(secondsToWait);
  }

  //behaviour/methods
  boolean isDone() {
    if (millis() >= endTime) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    startTime = millis();
    endTime = startTime + amountOfTimeToWait;
  }

  void reset(float secondsToWait) {
    startTime = millis();
    amountOfTimeToWait = int(secondsToWait * 1000);
    endTime = startTime + amountOfTimeToWait;
  }
}