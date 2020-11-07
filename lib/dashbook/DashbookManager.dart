import 'package:dash_book/dashbook/DashbookChapters.dart';
import 'package:dashbook/dashbook.dart';
import 'package:dashbook/decorator.dart';
import 'package:dashbook/widget.dart';
import 'package:flutter/widgets.dart';

class DashbookManager {

  //============================================================================
  // Class Instance Static Fields
  //============================================================================

  static DashbookManager _instance;

  //============================================================================
  // Class Instance Fields
  //============================================================================

  Dashbook dashBook;
  DashbookContext dashbookContext;

  //============================================================================
  // Constructors
  //============================================================================

  factory DashbookManager() {
    if (_instance == null) {
      _instance = DashbookManager._();
    }

    return _instance;
  }

  DashbookManager._() {
    dashBook = Dashbook();
  }

  //============================================================================
  // Constructors
  //============================================================================

  Story addStory(String storyName) {
    Story story = dashBook.storiesOf(storyName).decorator(CenterDecorator());
    return story;
  }

  Story addStoryWithChapters(String storyName, List<Chapter> chapters) {
    Story story = dashBook.storiesOf(storyName).decorator(CenterDecorator());
    story.chapters = chapters;
    return story;
  }

  void addChapterToStory(Story story, Chapter chapter) {
    for (Story storyItem in dashBook.stories) {
      if (story == storyItem) {
        storyItem.chapters.add(chapter);
      }
    }
  }
}