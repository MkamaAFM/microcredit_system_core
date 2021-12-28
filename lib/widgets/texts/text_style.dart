part of 'creative_text.dart';

enum _TextType {
  head,
  subhead,
  big,
  bigger,
  biggest,
  giant,
  normal,
  title,
  subtitle,
  caption,
  overline
}

TextStyle _textStyle(BuildContext context, _TextType _type) {
  final textTheme = Theme.of(context).textTheme;
  switch (_type) {
    case _TextType.head:
      return textTheme.headline5!;
    case _TextType.subhead:
      return textTheme.headline6!;
    case _TextType.big:
      return textTheme.headline4!;
    case _TextType.normal:
      return textTheme.bodyText2!;
    case _TextType.title:
      return textTheme.subtitle1!;
    case _TextType.subtitle:
      return textTheme.subtitle2!;
    case _TextType.caption:
      return textTheme.caption!;
    case _TextType.bigger:
      return textTheme.headline3!;
    case _TextType.overline:
      return textTheme.overline!;
    case _TextType.biggest:
      return textTheme.headline2!;
    case _TextType.giant:
      return textTheme.headline1!;
  }
}
