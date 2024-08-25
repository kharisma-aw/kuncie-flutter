import 'package:flutter/material.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/icon_button.dart';
import 'package:kuncie_flutter_test/presentation/ui/component/svg_icon.dart';
import 'package:kuncie_flutter_test/presentation/ui/text_style.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    this.placeholder,
    this.onChanged,
    this.onSearched,
    this.focusNode,
    this.autoFocus = false,
    this.controller,
    this.maxLength,
    this.keyboardType,
  });

  final String? placeholder;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onSearched;

  final FocusNode? focusNode;

  final bool autoFocus;

  final TextEditingController? controller;

  final int? maxLength;

  final TextInputType? keyboardType;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode {
    return widget.focusNode ?? (_focusNode ??= FocusNode());
  }

  late TextEditingController _controller;

  late var _showClearButton = false;

  ShapeBorder get _shape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color:
            _effectiveFocusNode.hasFocus ? Colors.blueAccent : Colors.black26,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_handleFocusChanged);
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_handleClearIcon);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode?.dispose();
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleFocusChanged() {
    setState(() {
      // Rebuild the widget on focus change to update border
    });
  }

  void _handleClearIcon() {
    if (!mounted) return;
    if (_showClearButton && _controller.text.isEmpty) {
      setState(() => _showClearButton = false);
    } else if (!_showClearButton && _controller.text.isNotEmpty) {
      setState(() => _showClearButton = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: _shape,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: _textField()),
            const SizedBox(width: 8),
            if (_showClearButton) ...[
              _clearButton(),
              const SizedBox(width: 2),
            ],
            _searchIcon(),
          ],
        ),
      ),
    );
  }

  Widget _searchIcon() {
    return const SvgIcon(
      path: 'assets/images/search_icon.svg',
      color: Colors.black38,
      size: 20,
    );
  }

  Widget _textField() {
    return TextField(
      autofocus: widget.autoFocus,
      autocorrect: false,
      controller: _controller,
      focusNode: _effectiveFocusNode,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        hintText: widget.placeholder,
        hintStyle: AppText.base.copyWith(color: Colors.black38),
      ),
      style: AppText.base,
      textInputAction: TextInputAction.search,
      cursorWidth: 1,
      cursorColor: Colors.lightBlueAccent,
      onChanged: widget.onChanged,
      onSubmitted: (value) {
        widget.onSearched?.call();
      },
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
    );
  }

  Widget _clearButton() {
    return AppIconButton(
      onPressed: () {
        _controller.text = '';
        widget.onChanged?.call('');
      },
      iconSize: 16,
      icon: const SvgIcon(
        path: 'assets/images/x_icon.svg',
        color: Colors.black38,
      ),
    );
  }
}
