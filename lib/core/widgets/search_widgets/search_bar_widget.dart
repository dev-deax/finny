import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onClear;
  final EdgeInsetsGeometry padding;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.onClear,
    this.padding = const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
  });

  @override
  Widget build(BuildContext context) {
    Widget searchField = TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: onClear ?? () => controller.clear(),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.colorScheme.primary,
            width: 2,
          ),
        ),
        filled: false,
      ),
    );

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: searchField,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
