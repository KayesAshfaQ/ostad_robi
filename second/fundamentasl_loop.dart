// for
void main(List<String> args) {
  for (int i = 0; i < 10; i++) {
    print('Mail deliver to $i');
  }

  // while
  bool isHungry = true;
  int count = 1;
  while (isHungry) {
    if (count > 15) {
      break;
    }
    print(' Eating food $count');

    if (count % 5 == 0) {
      print(' Taking a break');
    }

    count++;
  }

  // do while
  do {
    print('This will execute at least $count times');
    count++;
  } while (count < 20);

}
