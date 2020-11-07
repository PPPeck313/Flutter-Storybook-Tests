import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StorybookStories {

  //============================================================================
  // Default Widgets
  //============================================================================

  static final Story DEFAULT_TEXT_STORY = Story(
    name: 'Default Text',
    builder: (_, context) => Text(
        context.text("text", initial: "Text Example"),
        textAlign: context.options("text align", initial: TextAlign.center, options: [
          Option("left", TextAlign.left),
          Option("right", TextAlign.right),
          Option("center", TextAlign.center),
          Option("justify", TextAlign.justify),
          Option("start", TextAlign.start),
          Option("end", TextAlign.end)
        ]),
        textDirection: context.options("text direction", initial: TextDirection.rtl, options: [
          Option("rtl", TextDirection.rtl),
          Option("ltr", TextDirection.ltr),
        ]),
        style: TextStyle(
            fontWeight: context.options("font weight", initial: FontWeight.normal, options: [
              Option("w100", FontWeight.w100),
              Option("w200", FontWeight.w200),
              Option("w300", FontWeight.w300),
              Option("w400", FontWeight.w400),
              Option("w500", FontWeight.w500),
              Option("w600", FontWeight.w600),
              Option("w700", FontWeight.w700),
              Option("w800", FontWeight.w800),
              Option("w900", FontWeight.w900)
            ]),
            fontStyle: context.options("font style", initial: FontStyle.normal, options: [
              Option("normal", FontStyle.normal),
              Option("italic", FontStyle.italic),
            ]),
            fontSize: context.slider("font size", initial: 20, max: 40, min: 1)
        )
    )
  );

  //============================================================================
  // Form Widgets
  //============================================================================

  static final Story FORM_TEXT_STORY = Story(
      name: 'Form Text',
      builder: (_, context) => FormBuilder(
          key: GlobalKey<FormBuilderState>(),
          autovalidate: true,
          child: FormBuilderTextField(
              attribute: "FORM_TEXT",
              validators: context.options("validators", options: [
                Option("required", [FormBuilderValidators.required()]),
                Option("numeric", [FormBuilderValidators.numeric()]),
                Option("email", [FormBuilderValidators.email()]),
                Option("url", [FormBuilderValidators.url()]),
                Option("IP", [FormBuilderValidators.IP()]),
                Option("creditCard", [FormBuilderValidators.creditCard()]),
                Option("date", [FormBuilderValidators.date()])
              ]),
        )
    )
  );
}