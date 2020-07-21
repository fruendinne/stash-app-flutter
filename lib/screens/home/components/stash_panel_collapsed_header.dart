import 'package:flutter/material.dart';

class StashPanelCollapsedHeader extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final BorderRadiusGeometry borderRadius;

  final Widget appendLeft;
  final Widget appendRight;

  final Function onTap;

  StashPanelCollapsedHeader({
    this.backgroundColor = Colors.transparent,
    this.text = "",
    this.borderRadius = BorderRadius.zero,
    this.appendLeft,
    this.appendRight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { if (onTap != null) onTap(); },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              if (appendLeft != null) appendLeft,
              Expanded(
                  child: Center(
                      child: Text(text,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 20.0
                        ),
                      )
                  )
              ),
              if (appendRight != null) appendRight,
            ],
          ),
        ),
      ),
    );
  }
}
