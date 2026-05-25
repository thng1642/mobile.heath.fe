
import 'package:flutter_test/flutter_test.dart';

import 'package:healthycare/main.dart';
import 'package:healthycare/screens/login_screen.dart';

void main() {
  testWidgets('App shows login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that LoginScreen is shown.
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Đăng nhập'), findsWidgets);
  });
}
