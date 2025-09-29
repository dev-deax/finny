import 'package:finny/core/extension/build_context_extension.dart';
import 'package:finny/core/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

class ModulesListWidget extends StatelessWidget {
  const ModulesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      {'title': 'Fundamentos de tus finanzas', 'duration': '1 hora'},
      {'title': 'Presupuesto y control de gastos', 'duration': '2 horas'},
      {'title': 'Ahorro, metas e inversiones', 'duration': '2 horas'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeaderWidget(text: 'Módulos'),
        const SizedBox(height: 16),
        ...modules.map((module) => _buildModuleCard(context, module)),
      ],
    );
  }

  Widget _buildModuleCard(BuildContext context, Map<String, String> module) {
    return Container(
      width: 358,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colorScheme.secondaryFixed,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          _buildImage(context),
          const SizedBox(width: 16),
          Expanded(child: _buildInfo(module, context)),
        ],
      ),
    );
  }

  Column _buildInfo(Map<String, String> module, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          module['title']!,
          style: context.textTheme.labelMedium?.copyWith(
            fontSize: 16,
            color: context.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              Icons.access_time_filled,
              color: context.colorScheme.onTertiaryFixed,
            ),
            const SizedBox(width: 8),
            Text(
              module['duration']!,
              style: context.textTheme.titleSmall?.copyWith(
                color: context.colorScheme.onTertiaryFixed,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container _buildImage(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimaryFixed,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.videocam, color: context.colorScheme.surfaceTint, size: 36),
    );
  }
}
