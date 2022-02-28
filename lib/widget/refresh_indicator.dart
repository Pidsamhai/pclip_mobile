import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CustomFooter footerRefreshIndicator() {
  return CustomFooter(
    loadStyle: LoadStyle.ShowWhenLoading,
    builder: ((context, mode) {
      if (mode == LoadStatus.loading) {
        return const SizedBox(
          height: 60,
          child: Center(
            child: SizedBox(
              height: 20.0,
              width: 20.0,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        return Container();
      }
    }),
  );
}

CustomHeader headerRefreshIndicator() {
  return CustomHeader(
    refreshStyle: RefreshStyle.Follow,
    completeDuration: const Duration(microseconds: 0),
    builder: ((context, mode) {
      if (mode == RefreshStatus.refreshing) {
        return const SizedBox(
          height: 60,
          child: Center(
            child: SizedBox(
              height: 20.0,
              width: 20.0,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else {
        return Container();
      }
    }),
  );
}
