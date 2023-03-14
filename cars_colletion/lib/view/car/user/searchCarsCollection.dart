import 'package:flutter/material.dart';

class SearchCarCollection extends SliverPersistentHeaderDelegate {
  final Function(String) onSearch;

  SearchCarCollection({required this.onSearch});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
              color: Color.fromRGBO(83, 97, 125, 1.0),
              boxShadow: [BoxShadow(color: Colors.black26)]),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[350]?.withOpacity(0.3),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(
                      bottom: 10.0, right: 10.0, top: 10.0, left: -12.0),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey[350]?.withOpacity(0.3),
                  )),
              style: TextStyle(
                color: Colors.grey[350]?.withOpacity(0.3),
              ),
              onChanged: onSearch,
            ),
          ),
        ));
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
