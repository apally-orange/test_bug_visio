import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.backIconShow,
    this.onTapSuffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool backIconShow;
  final VoidCallback onTapSuffixIcon;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final lightGrey = Colors.grey;

    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        filled: true,
        hintText: 'search...',
        fillColor: Colors.white,
        focusColor: lightGrey,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: backIconShow
              ? IconButton(
                  onPressed: () {
                    final FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  color: lightGrey,
                )
              : IconButton(
                  onPressed: () => null,
                  icon: const Icon(Icons.search),
                  color: lightGrey,
                ),
        ),
      ),
    );
  }
}
