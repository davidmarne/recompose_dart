@TestOn('browser')
library branch_test;

import 'package:test/test.dart';
import 'package:recompose_dart/recompose_dart.dart';
import 'package:over_react/over_react.dart';
import 'package:react/react_client.dart' as react_client;
import 'package:react/react_test_utils.dart' as react_test_utils;

main() {
  react_client.setClientConfiguration();
  enableTestMode();

  test('renders right if true', () {
    var component = react_test_utils.renderIntoDocument(
      brancher(new TestProps()..leftOrRight = true),
    );

    var elementA = react_test_utils.findRenderedDOMComponentWithClass(component, 'a');
    var elementB = react_test_utils.findRenderedDOMComponentWithClass(component, 'b');

    expect(elementA, isNotNull);
    expect(elementB, isNull);
  });

  test('renders left if false', () {
    var component = react_test_utils.renderIntoDocument(
      brancher(new TestProps()..leftOrRight = false),
    );

    var elementA = react_test_utils.findRenderedDOMComponentWithClass(component, 'a');
    var elementB = react_test_utils.findRenderedDOMComponentWithClass(component, 'b');

    expect(elementA, isNull);
    expect(elementB, isNotNull);
  });
}

class TestProps {
  bool leftOrRight;
}

var brancher = branch((TestProps p) => p.leftOrRight, left, right);
ReactElement left(TestProps props) => (Dom.div()..className = 'a')();
ReactElement right(TestProps props) => (Dom.div()..className = 'b')();
