import 'package:flutter_test/flutter_test.dart';
import 'package:printflow/main.dart';
import 'package:printflow/resources/textplaceholder.dart';

void main() {
  testWidgets('next opens the following screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(appname), findsOneWidget);
    await tester.tap(find.text(nexttext));
    await tester.pumpAndSettle();

    expect(find.text(welcomeback), findsOneWidget);
  });
}
