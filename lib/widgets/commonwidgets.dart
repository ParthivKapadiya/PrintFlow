import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';

class PageTop extends StatelessWidget {
  const PageTop(this.title, this.back, {super.key});

  final String title;
  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: back,
          icon: const Icon(Icons.arrow_back, color: textcolor),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textcolor,
            ),
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }
}

class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: textcolor,
        ),
      ),
    );
  }
}

class FieldBox extends StatelessWidget {
  const FieldBox(this.hint, {super.key, this.lines = 1, this.icon});

  final String hint;
  final int lines;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: lines > 1 ? 14 : 14),
      decoration: BoxDecoration(
        color: fieldcolor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              hint,
              style: const TextStyle(color: hintcolor, fontSize: 14),
            ),
          ),
          if (icon != null) Icon(icon, color: hintcolor, size: 20),
        ],
      ),
    );
  }
}

class DarkButton extends StatelessWidget {
  const DarkButton(this.text, this.onTap, {super.key});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: navycolor,
          foregroundColor: whitecolor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton(this.text, this.onTap, {super.key, this.icon});

  final String text;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: bluecolor,
      foregroundColor: whitecolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: icon == null
          ? ElevatedButton(
              style: style,
              onPressed: onTap,
              child: Text(text, style: const TextStyle(fontSize: 16)),
            )
          : ElevatedButton.icon(
              style: style,
              onPressed: onTap,
              icon: Icon(icon, size: 18),
              label: Text(text, style: const TextStyle(fontSize: 16)),
            ),
    );
  }
}

class ClothBox extends StatelessWidget {
  const ClothBox(this.color, {super.key, this.height = 120});

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.checkroom, color: whitecolor, size: 42),
    );
  }
}

class WhiteCard extends StatelessWidget {
  const WhiteCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: padding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: child,
    );
  }
}
