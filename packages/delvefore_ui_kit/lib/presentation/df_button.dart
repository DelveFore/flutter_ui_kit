library delvefore_ui_kit;

import 'package:flutter/material.dart';

enum DfButtonColor { primary, secondary }

enum DfButtonType { primary, secondary, text }

class _PrimaryButton extends DfButton {
  const _PrimaryButton({
    Key? key,
    required label,
    required onPressed,
    bool disabled = false,
  }) : super(
          key: key,
          label: label,
          onPressed: onPressed,
          disabled: disabled,
          type: DfButtonType.primary,
        );
}

class _SecondaryButton extends DfButton {
  const _SecondaryButton({
    Key? key,
    required label,
    required onPressed,
    bool disabled = false,
    IconData? icon,
    double? width,
    double? height,
  }) : super(
          key: key,
          label: label,
          onPressed: onPressed,
          disabled: disabled,
          type: DfButtonType.secondary,
          icon: icon,
          width: width,
          height: height,
        );
}

class _TextButton extends DfButton {
  const _TextButton({
    Key? key,
    required label,
    required onPressed,
    bool disabled = false,
    IconData? icon,
    double? width,
    double? height,
  }) : super(
          key: key,
          label: label,
          onPressed: onPressed,
          disabled: disabled,
          type: DfButtonType.text,
          icon: icon,
          width: width,
          height: height,
        );
}

class DfButton extends StatelessWidget {
  const DfButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.buttonColor = DfButtonColor.primary,
    this.disabled = false,
    this.type = DfButtonType.primary,
    this.width,
    this.height,
    this.icon,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String label;
  final DfButtonColor buttonColor;
  final bool disabled;
  final DfButtonType type;
  final double? width;
  final double? height;
  final IconData? icon;

  Size? getSize() {
    if (width != null && height == null) {
      return Size.fromWidth(width!);
    } else if (width == null && height != null) {
      return Size.fromHeight(height!);
    } else if (width != null && height != null) {
      return Size(width!, height!);
    }
    return null;
  }

  Widget buildSecondary(BuildContext context) {
    Color buttonColor = Theme.of(context).colorScheme.primary;
    ButtonStyle style = OutlinedButton.styleFrom(
      fixedSize: getSize(),
      side: BorderSide(
        color: buttonColor,
        width: 1.0,
      ),
    );
    if (icon != null) {
      return ButtonTheme(
        child: OutlinedButton.icon(
          onPressed: disabled ? null : onPressed,
          style: style,
          icon: Icon(icon),
          label: Text(
            label,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      );
    }
    return ButtonTheme(
      child: OutlinedButton(
        onPressed: disabled ? null : onPressed,
        style: style,
        child: Text(
          label,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }

  Widget buildText(BuildContext context) {
    if (icon != null) {
      return ButtonTheme(
        child: TextButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(decoration: TextDecoration.underline),
          ),
        ),
      );
    }
    return ButtonTheme(
      child: TextButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color labelColor = Theme.of(context).colorScheme.onPrimary;
    Color buttonColor = Theme.of(context).colorScheme.primary;

    if (type == DfButtonType.secondary) {
      return buildSecondary(context);
    } else if (type == DfButtonType.text) {
      return buildText(context);
    }
    return ButtonTheme(
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: getSize(),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: labelColor),
        ),
      ),
    );
  }

  const factory DfButton.primary({
    required String label,
    required VoidCallback onPressed,
    bool disabled,
  }) = _PrimaryButton;

  const factory DfButton.secondary({
    required String label,
    required VoidCallback onPressed,
    bool disabled,
    IconData? icon,
    double? width,
    double? height,
  }) = _SecondaryButton;

  const factory DfButton.text({
    required String label,
    required VoidCallback onPressed,
    bool disabled,
    IconData? icon,
    double? width,
    double? height,
  }) = _TextButton;
}
