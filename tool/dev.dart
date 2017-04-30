library tool.dev;

import 'package:dart_dev/dart_dev.dart' show dev, config;

main(List<String> args) async {
  const directories = const <String>[
    'lib/',
  ];

  config.analyze
    ..strong = false
    ..entryPoints = directories;

  config.test
    ..pubServe = true
    ..concurrency = 1
    ..unitTests = [
      'test/unit/',
    ];

  config.coverage
    ..html = false
    ..pubServe = true
    ..reportOn = ['lib/'];

  await dev(args);
}
