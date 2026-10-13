import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App smoke test - renders LoginScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Login to Account is shown on LoginScreen.
    expect(find.text('Login to Account'), findsOneWidget);
  });
}
