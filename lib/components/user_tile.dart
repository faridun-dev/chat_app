import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: 25.0,
        ),
        child: Container(
          padding: const EdgeInsets.all(
            25.0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.person,
              ),
              const SizedBox(
                width: 13.0,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
