part of 'characters_tab.dart';

class _CharactersTabState extends State<CharactersTab> {
  late final ScrollController _scrollController;
  late final TextEditingController _nameController;
  late final FocusNode _nameFocusNode;
  bool _filtersExpanded = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _nameController = TextEditingController(text: widget.state.filterName);
    _nameFocusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant CharactersTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.filterName != widget.state.filterName &&
        !_nameFocusNode.hasFocus) {
      _nameController.value = TextEditingValue(
        text: widget.state.filterName,
        selection: TextSelection.collapsed(offset: widget.state.filterName.length),
      );
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final position = _scrollController.position;
    if (position.maxScrollExtent - position.pixels <= 300) {
      widget.onLoadMore();
    }
  }

  void _applyFilters({
    String? name,
    CharacterStatusFilter? status,
    CharacterGenderFilter? gender,
  }) {
    widget.onFiltersChanged(
      name: (name ?? widget.state.filterName).trim(),
      status: status ?? widget.state.filterStatus,
      gender: gender ?? widget.state.filterGender,
    );
  }

  void _clearFilters() {
    _nameController.clear();
    _nameFocusNode.unfocus();
    widget.onFiltersChanged(
      name: '',
      status: CharacterStatusFilter.any,
      gender: CharacterGenderFilter.any,
    );
  }

  void _toggleFilters() {
    setState(() {
      _filtersExpanded = !_filtersExpanded;
    });
    if (!_filtersExpanded) {
      _nameFocusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    if (state.status == HomeStatus.loading && state.characters.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.status == HomeStatus.failure && state.characters.isEmpty) {
      return ErrorStateView(
        message: state.errorMessage ?? 'Не удалось загрузить персонажей.',
        onRetry: widget.onRetry,
      );
    }

    return CharactersTabView(
      state: state,
      scrollController: _scrollController,
      nameController: _nameController,
      nameFocusNode: _nameFocusNode,
      filtersExpanded: _filtersExpanded,
      onApplyName: () => _applyFilters(name: _nameController.text),
      onStatusSelected: (value) => _applyFilters(status: value),
      onGenderSelected: (value) => _applyFilters(gender: value),
      onClearFilters: _clearFilters,
      onToggleFilters: _toggleFilters,
      onRefresh: widget.onRefresh,
      onFavoriteToggle: widget.onFavoriteToggle,
    );
  }
}
