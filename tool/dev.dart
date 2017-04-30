library tool.dev;

import 'package:dart_dev/dart_dev.dart' show dev, config, TestRunnerConfig, Environment;

main(List<String> args) async {
  const directories = const <String>[
    'lib/',
    'test/',
  ];

  config.format..lineLength = 100;

  config.analyze
    ..strong = false
    ..entryPoints = directories;

  config.test
    ..pubServe = true
    ..concurrency = 1
    ..platforms = ['content-shell']
    ..unitTests = [
      'test/generated_runner.dart',
    ];

  config.genTestRunner.configs = [
    new TestRunnerConfig(directory: 'test', env: Environment.browser, genHtml: true, dartHeaders: [
      "import 'package:react/react_client.dart' as react_client;",
      "import 'package:over_react/over_react.dart';"
    ], preTestCommands: [
      "react_client.setClientConfiguration();",
      "enableTestMode();",
    ], htmlHeaders: [
      '<script src="packages/react/react_with_addons.js"></script>',
      '<script src="packages/react/react_dom.js"></script>',
    ]),
  ];

  config.coverage
    ..html = false
    ..pubServe = true
    ..reportOn = ['lib/'];

  await dev(args);
}
