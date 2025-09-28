import 'package:finny/core/widgets/state_widgets/error_state_widget.dart';
import 'package:finny/core/widgets/state_widgets/loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/filter_option.dart';
import '../providers/filter_provider.dart';

class FilterDropdown extends ConsumerStatefulWidget {
  final String title;
  final String filterType;
  final String searchHint;
  final IconData icon;

  const FilterDropdown({
    super.key,
    required this.title,
    required this.filterType,
    required this.searchHint,
    required this.icon,
  });

  @override
  ConsumerState<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends ConsumerState<FilterDropdown> {
  final TextEditingController _searchController = TextEditingController();
  List<FilterOption> _filteredOptions = [];
  List<FilterOption> _allOptions = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _filteredOptions = _allOptions.where((option) {
        return option.name.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    });
  }

  void _toggleOption(FilterOption option) {
    switch (widget.filterType) {
      case 'products':
        ref.read(filterStateProvider.notifier).toggleProduct(option);
        break;
      case 'roles':
        ref.read(filterStateProvider.notifier).toggleRole(option);
        break;
      case 'levels':
        ref.read(filterStateProvider.notifier).toggleLevel(option);
        break;
      case 'subjects':
        ref.read(filterStateProvider.notifier).toggleSubject(option);
        break;
    }
  }

  bool _isOptionSelected(FilterOption option) {
    final filterState = ref.watch(filterStateProvider);

    switch (widget.filterType) {
      case 'products':
        return filterState.selectedProducts.any((p) => p.id == option.id);
      case 'roles':
        return filterState.selectedRoles.any((r) => r.id == option.id);
      case 'levels':
        return filterState.selectedLevels.any((l) => l.id == option.id);
      case 'subjects':
        return filterState.selectedSubjects.any((s) => s.id == option.id);
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filterOptionsAsync = ref.watch(filterOptionsProvider(widget.filterType));

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSearch(),
          const SizedBox(height: 16),
          filterOptionsAsync.when(
            data: (options) {
              _allOptions = options;
              if (_filteredOptions.isEmpty) {
                _filteredOptions = options;
              }

              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: _filteredOptions.length,
                  itemBuilder: (context, index) {
                    final option = _filteredOptions[index];
                    final isSelected = _isOptionSelected(option);

                    return _buildItem(option, isSelected);
                  },
                ),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(32.0),
              child: LoadingStateWidget(),
            ),
            error: (error, stack) => Padding(
              padding: const EdgeInsets.all(32.0),
              child: ErrorStateWidget(message: 'Error al cargar ${widget.title.toLowerCase()}'),
            ),
          ),
        ],
      ),
    );
  }

  CheckboxListTile _buildItem(FilterOption option, bool isSelected) {
    return CheckboxListTile(
      title: Text(
        option.name,
        style: const TextStyle(fontSize: 14),
      ),
      value: isSelected,
      onChanged: (value) => _toggleOption(option),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 0,
      ),
    );
  }

  Padding _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: widget.searchHint,
          prefixIcon: const Icon(Icons.search, size: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
      ),
    );
  }
}
