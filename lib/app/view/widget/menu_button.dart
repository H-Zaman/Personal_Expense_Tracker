import 'package:expensetracker/utilites/text_style.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? label;
  final VoidCallback? onTap;
  const MenuButton({
    Key? key,
    this.onTap,
    this.icon,
    this.label,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;
    if(icon != null) leadingWidget = Icon(
      icon,
      size: 22,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: onTap,
          dense: true,
          contentPadding: leadingWidget == null ? null : EdgeInsets.zero,
          minLeadingWidth: 0,
          leading: leadingWidget,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.medium(context)
                ),
              ),
              if(label != null) _Label(label: label!)
            ],
          ),
          trailing: onTap != null ? Icon(
            Icons.chevron_right,
          ) : null,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 4),
          height: 1.5,
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String label;
  const _Label({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        label,
        style: AppTextStyle.extraSmallInverted(context)
      ),
    );
  }
}