import 'package:flutter/foundation.dart';
import 'package:swipe_cards/draggable_card.dart';
class SwipeItem {
  final String content;
  final VoidCallback? likeAction;
  final VoidCallback? nopeAction;
  final VoidCallback? superlikeAction;
  final ValueChanged<SlideRegion?>? onSlideUpdate;

  SwipeItem({
    required this.content,
    this.likeAction,
    this.nopeAction,
    this.superlikeAction,
    this.onSlideUpdate,
  });
}