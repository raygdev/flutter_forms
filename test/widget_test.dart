// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_forms/src/app.dart';

void main() {
  testWidgets('Text Inputs render', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    final emailLabel = find.text('Email Address');
    final passwordLabel = find.text('Password');

    final emailTextFormField = find.ancestor(
      of: emailLabel,
      matching: find.byType(TextFormField)
    );

    final passwordTextFormField = find.ancestor(
      of: passwordLabel,
      matching: find.byType(TextFormField)
    );

    expect(emailLabel, findsOneWidget);
    expect(passwordLabel, findsOneWidget);
    expect(emailTextFormField, findsOneWidget);
    expect(passwordTextFormField, findsOneWidget);
  });

  testWidgets('Shows error when no input', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    // find and press submit button
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // find the error text widgets
    final emailError = find.text('Please enter a valid email');
    final passwordError = find.text('Please enter a valid password');

    // assert both error widgets are present with text
    expect(emailError, findsOneWidget);
    expect(passwordError, findsOneWidget);
  });

  testWidgets('Shows email error when no @ is present', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    // find the first input widget (email)
    final emailInput = find.byType(TextFormField).first;
    
    // enter an invalid email and press the submit button
    await tester.enterText(emailInput, 'notValidEmail');
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // find the email error widget
    final emailError = find.text('Please enter a valid email');

    // assert that the email error is present
    expect(emailError, findsOneWidget);

  });
  
  testWidgets('Shows password error when less than 4 characters entered', (WidgetTester tester) async {
    await tester.pumpWidget(App());
    // find the last input widget (password)
    final passwordInput = find.byType(TextFormField).last;
    
    // enter an invalid password and press the submit button
    await tester.enterText(passwordInput, '123');
    await tester.tap(find.text('Submit'));
    await tester.pump();

    // find the password error widget
    final passwordError = find.text('Please enter a valid password');

    // assert that the password error is present
    expect(passwordError, findsOneWidget);

  });
}
