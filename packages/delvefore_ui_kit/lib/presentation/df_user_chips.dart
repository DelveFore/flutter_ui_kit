import 'package:flutter/material.dart';

class UserInputChip extends StatelessWidget {
  const UserInputChip({
    Key? key,
    required this.name,
    required this.avatarUrl,
    this.onPressed,
    this.onDeleted,
    this.backgroundColor,
  }) : super(key: key);
  final String name, avatarUrl;
  final VoidCallback? onPressed, onDeleted;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InputChip(
        backgroundColor: backgroundColor,
        label: Text(name),
        avatar: CircleAvatar(
          backgroundColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(avatarUrl),
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        onDeleted: onDeleted,
      ),
    );
  }
}
