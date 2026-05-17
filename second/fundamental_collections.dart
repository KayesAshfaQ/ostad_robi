void main(List<String> args) {
  List<String> backpack = [
    'Water Bottle',
    'Notebook',
    'Pen',
    'Sunglasses',
    'Sunglasses',
    'Sunglasses',
  ];

  print('Backpack contents: $backpack');

  backpack.remove('Notebook');
  backpack.removeAt(0); // Remove the first item (Water Bottle)
  print('Backpack after removing notebook: $backpack');

  for (int i = 0; i < backpack.length; i++) {
    print('backpack item ${backpack[i]}');
  }

  backpack.add('Snacks');
  backpack.add('First Aid Kit');
  backpack.add('Map');
  backpack.add('and more');
  print('Backpack after adding snacks: $backpack');

  backpack.sort();
  print('Backpack after sorting: $backpack');



  Set<String> boucner = {};
  boucner = {
    'Jhon Doe',
    'Jhon Doe',
    'Pen',
    if(!boucner.contains('Sunglasses')) 'Sunglasses' else if (!backpack.contains('Sunglasses')) 'Sunglasses' else 'Already have sunglasses',
    'Sunglasses',
    'Sunglasses',
  };

  // merge bouncer with backpack
  var superBackpack = [...backpack, if (boucner.length > 3) ...boucner];
  print('Super Backpack contents: $superBackpack');

  print('Set contents: ${boucner.length}');

  for (var element in boucner) {
    print('Set element: $element');
  }

  Map<int, String> locker = {
    1: 'Note Book',
    2: 'Pen',
    3: 'Sunglasses',
    4: 'Sunglasses',
    5: 'Sunglasses',
  };

  print('Locker contents: $locker');
  print('Locker values: ${locker.values}');
  print('Locker keys: ${locker.keys}');

  locker[100] = 'Snacks';
  locker[10] = 'First Aid Kit';
  print('Locker after adding snacks: $locker');

  var locker2 = locker.map((key, value) {
    return MapEntry(key, value.toLowerCase());
  });
  print('Locker after mapping: $locker2');
  print('Locker2 type: ${locker2.runtimeType}');
}
