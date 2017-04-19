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

  test('flips from true', () {
    var component = react_test_utils.renderIntoDocument(
      mappedComp(new TestProps()..start = true),
    );

    var elementA = react_test_utils.findRenderedDOMComponentWithClass(component, 'true');
    var elementB = react_test_utils.findRenderedDOMComponentWithClass(component, 'false');

    expect(elementA, isNull);
    expect(elementB, isNotNull);
  });

  test('flips from false', () {
    var component = react_test_utils.renderIntoDocument(
      mappedComp(new TestProps()..start = false),
    );

    var elementA = react_test_utils.findRenderedDOMComponentWithClass(component, 'true');
    var elementB = react_test_utils.findRenderedDOMComponentWithClass(component, 'false');

    expect(elementA, isNotNull);
    expect(elementB, isNull);
  });
}

class TestProps {
  bool start;
}

class TestMappedProps {
  bool mapped;
}

var mappedComp = withProps<TestProps, TestMappedProps>(
  (TestProps p) => new TestMappedProps()..mapped = !p.start,
)(comp);

comp(TestMappedProps props) => (Dom.div()..className = '${props.mapped}')();
