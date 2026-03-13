import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:any_planner/app.dart';

void main() {
  testWidgets('App launches', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: AnyPlannerApp()),
    );
    // App should render without crashing
    expect(find.text('あとでやる'), findsAny);
  });
}
