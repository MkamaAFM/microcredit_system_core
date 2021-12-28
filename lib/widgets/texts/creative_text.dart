import 'package:flutter/material.dart';
part 'text_style.dart';

class CreativeText extends StatelessWidget {
  final String text;
  final bool selectable;
  final _TextType _type;

  @override
  Widget build(BuildContext context) {
    final style = _textStyle(context, _type);
    return selectable
        ? SelectableText(text, style: style)
        : Text(text, style: style);
  }

  const CreativeText.head(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.head,
        super(key: key);
  const CreativeText.subhead(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.subhead,
        super(key: key);
  const CreativeText.big(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.big,
        super(key: key);
  const CreativeText.bigger(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.bigger,
        super(key: key);
  const CreativeText.biggest(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.biggest,
        super(key: key);
  const CreativeText.giant(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.giant,
        super(key: key);
  const CreativeText.normal(this.text, {Key? key, this.selectable = false})
      : _type = _TextType.normal,
        super(key: key);
  const CreativeText.title(this.text, {Key? key, this.selectable = false})
      : _type = _TextType.title,
        super(key: key);
  const CreativeText.subtitle(this.text, {Key? key, this.selectable = false})
      : _type = _TextType.subtitle,
        super(key: key);
  const CreativeText.caption(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.caption,
        super(key: key);
  const CreativeText.overline(this.text, {Key? key})
      : selectable = false,
        _type = _TextType.overline,
        super(key: key);
}
