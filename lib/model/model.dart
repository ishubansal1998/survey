// To parse this JSON data, do
//
//     final survey = surveyFromJson(jsonString);

import 'dart:convert';

class Survey {
  Survey({
    this.id,
    this.title,
    this.settings,
    this.welcomeScreens,
    this.thankyouScreens,
    this.fields,
  });

  String id;
  String title;
  Settings settings;
  List<WelcomeScreen> welcomeScreens;
  List<ThankyouScreen> thankyouScreens;
  List<Field> fields;

  factory Survey.fromRawJson(String str) => Survey.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
        id: json["id"],
        title: json["title"],
        settings: Settings.fromJson(json["settings"]),
        welcomeScreens: List<WelcomeScreen>.from(
            json["welcome_screens"].map((x) => WelcomeScreen.fromJson(x))),
        thankyouScreens: List<ThankyouScreen>.from(
            json["thankyou_screens"].map((x) => ThankyouScreen.fromJson(x))),
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "settings": settings.toJson(),
        "welcome_screens":
            List<dynamic>.from(welcomeScreens.map((x) => x.toJson())),
        "thankyou_screens":
            List<dynamic>.from(thankyouScreens.map((x) => x.toJson())),
        "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
      };
}

class Field {
  Field({
    this.id,
    this.title,
    this.validations,
    this.type,
    this.properties,
  });

  String id;
  String title;
  Validations validations;
  String type;
  FieldProperties properties;

  factory Field.fromRawJson(String str) => Field.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["id"],
        title: json["title"],
        validations: Validations.fromJson(json["validations"]),
        type: json["type"],
        properties: json["properties"] == null
            ? null
            : FieldProperties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "validations": validations.toJson(),
        "type": type,
        "properties": properties == null ? null : properties.toJson(),
      };
}

class FieldProperties {
  FieldProperties({
    this.alphabeticalOrder,
    this.choices,
    this.steps,
    this.shape,
    this.structure,
    this.separator,
  });

  bool alphabeticalOrder;
  List<Choice> choices;
  int steps;
  String shape;
  String structure;
  String separator;

  factory FieldProperties.fromRawJson(String str) =>
      FieldProperties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FieldProperties.fromJson(Map<String, dynamic> json) =>
      FieldProperties(
        alphabeticalOrder: json["alphabetical_order"] == null
            ? null
            : json["alphabetical_order"],
        choices: json["choices"] == null
            ? null
            : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        steps: json["steps"] == null ? null : json["steps"],
        shape: json["shape"] == null ? null : json["shape"],
        structure: json["structure"] == null ? null : json["structure"],
        separator: json["separator"] == null ? null : json["separator"],
      );

  Map<String, dynamic> toJson() => {
        "alphabetical_order":
            alphabeticalOrder == null ? null : alphabeticalOrder,
        "choices": choices == null
            ? null
            : List<dynamic>.from(choices.map((x) => x.toJson())),
        "steps": steps == null ? null : steps,
        "shape": shape == null ? null : shape,
        "structure": structure == null ? null : structure,
        "separator": separator == null ? null : separator,
      };
}

class Choice {
  Choice({
    this.label,
  });

  String label;

  factory Choice.fromRawJson(String str) => Choice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
      };
}

class Validations {
  Validations({
    this.required,
  });

  bool required;

  factory Validations.fromRawJson(String str) =>
      Validations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Validations.fromJson(Map<String, dynamic> json) => Validations(
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "required": required,
      };
}

class Settings {
  Settings({
    this.language,
    this.progressBar,
    this.showProgressBar,
  });

  String language;
  String progressBar;
  bool showProgressBar;

  factory Settings.fromRawJson(String str) =>
      Settings.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        language: json["language"],
        progressBar: json["progress_bar"],
        showProgressBar: json["show_progress_bar"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
        "progress_bar": progressBar,
        "show_progress_bar": showProgressBar,
      };
}

class ThankyouScreen {
  ThankyouScreen({
    this.title,
    this.properties,
    this.attachment,
  });

  String title;
  ThankyouScreenProperties properties;
  Attachment attachment;

  factory ThankyouScreen.fromRawJson(String str) =>
      ThankyouScreen.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ThankyouScreen.fromJson(Map<String, dynamic> json) => ThankyouScreen(
        title: json["title"],
        properties: ThankyouScreenProperties.fromJson(json["properties"]),
        attachment: json["attachment"] == null
            ? null
            : Attachment.fromJson(json["attachment"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "properties": properties.toJson(),
        "attachment": attachment == null ? null : attachment.toJson(),
      };
}

class Attachment {
  Attachment({
    this.type,
    this.href,
  });

  String type;
  String href;

  factory Attachment.fromRawJson(String str) =>
      Attachment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        type: json["type"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "href": href,
      };
}

class ThankyouScreenProperties {
  ThankyouScreenProperties({
    this.showButton,
    this.shareIcons,
    this.buttonMode,
    this.buttonText,
  });

  bool showButton;
  bool shareIcons;
  String buttonMode;
  String buttonText;

  factory ThankyouScreenProperties.fromRawJson(String str) =>
      ThankyouScreenProperties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ThankyouScreenProperties.fromJson(Map<String, dynamic> json) =>
      ThankyouScreenProperties(
        showButton: json["show_button"],
        shareIcons: json["share_icons"],
        buttonMode: json["button_mode"],
        buttonText: json["button_text"],
      );

  Map<String, dynamic> toJson() => {
        "show_button": showButton,
        "share_icons": shareIcons,
        "button_mode": buttonMode,
        "button_text": buttonText,
      };
}

class WelcomeScreen {
  WelcomeScreen({
    this.title,
    this.properties,
  });

  String title;
  WelcomeScreenProperties properties;

  factory WelcomeScreen.fromRawJson(String str) =>
      WelcomeScreen.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WelcomeScreen.fromJson(Map<String, dynamic> json) => WelcomeScreen(
        title: json["title"],
        properties: WelcomeScreenProperties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "properties": properties.toJson(),
      };
}

class WelcomeScreenProperties {
  WelcomeScreenProperties({
    this.showButton,
    this.description,
    this.buttonText,
  });

  bool showButton;
  String description;
  String buttonText;

  factory WelcomeScreenProperties.fromRawJson(String str) =>
      WelcomeScreenProperties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WelcomeScreenProperties.fromJson(Map<String, dynamic> json) =>
      WelcomeScreenProperties(
        showButton: json["show_button"],
        description: json["description"],
        buttonText: json["button_text"],
      );

  Map<String, dynamic> toJson() => {
        "show_button": showButton,
        "description": description,
        "button_text": buttonText,
      };
}
