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

  test('runs both mappers ', () {
    var component = react_test_utils.renderIntoDocument(
      composed(new TestProps()..start = 1),
    );

    var element = react_test_utils.findRenderedDOMComponentWithClass(component, '4');
    expect(element, isNotNull);
  });
}

class TestProps {
  int start;
}

class TestMiddleProps {
  int middle;
}

class TestEndProps {
  int end;
}

var startToMid = withProps<TestProps, TestMiddleProps>(
  (TestProps p) => new TestMiddleProps()..middle = p.start + 1,
);

var midToEnd = withProps<TestMiddleProps, TestEndProps>(
  (TestMiddleProps p) => new TestEndProps()..end = p.middle + 2,
);

var composed = compose<TestProps, TestEndProps>([
  startToMid,
  midToEnd,
])(comp);

ReactElement comp(TestEndProps props) => (Dom.div()..className = '${props.end}')();
