import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DashbookChapters {

  //============================================================================
  // Default Widgets
  //============================================================================

  static Chapter makeDefaultTextChapter(Story story) {
    return Chapter("text",
            (dashbookContext) => Text(
                dashbookContext.textProperty("text", "Text Example"),
                textAlign: dashbookContext.listProperty("text align", TextAlign.center, TextAlign.values),
                textDirection: dashbookContext.listProperty("text direction", TextDirection.rtl, TextDirection.values),
                style: TextStyle(
                    fontWeight: dashbookContext.listProperty("font weight", FontWeight.normal, FontWeight.values),
                    fontStyle: dashbookContext.listProperty("font style", FontStyle.normal, FontStyle.values),
                    fontSize: dashbookContext.numberProperty("font size", 20)
                )
            ),
            story
    );
  }

  //============================================================================
  // Form Widgets
  //============================================================================

  static Chapter makeFormTextChapter(Story story) {
    return Chapter("text",
            (dashbookContext) => FormBuilder(
                key: GlobalKey<FormBuilderState>(),
                autovalidate: true,
                child: FormBuilderTextField(
                    attribute: "FORM_TEXT",
                    validators: dashbookContext.listProperty("validators", null,
                        [[FormBuilderValidators.required()],
                          [FormBuilderValidators.numeric()],
                          [FormBuilderValidators.email()],
                          [FormBuilderValidators.url()],
                          [FormBuilderValidators.IP()],
                          [FormBuilderValidators.creditCard()],
                          [FormBuilderValidators.date()]])
                ),
            ),
            story
    );
  }
}