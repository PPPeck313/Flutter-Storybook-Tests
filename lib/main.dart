import 'package:dash_book/RetainedTab.dart';
import 'package:dash_book/dashbook/DashbookManager.dart';
import 'package:dash_book/storybook/StorybookStories.dart';
import 'package:dashbook/story.dart' as dash;
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'dashbook/DashbookChapters.dart';
import 'storybook/StorybookStories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //============================================================================
  // Lifecycle Methods
  //============================================================================

  @override
  Widget build(BuildContext context) {
    DashbookManager dashbookManager = DashbookManager();

    dash.Story defaultStory = dashbookManager.addStory("Default");
    dashbookManager.addChapterToStory(defaultStory, DashbookChapters.makeDefaultTextChapter(defaultStory));

    dash.Story formStory = dashbookManager.addStory("Form");
    dashbookManager.addChapterToStory(formStory, DashbookChapters.makeFormTextChapter(defaultStory));

    Storybook storybook = Storybook(
        children: [
          StorybookStories.DEFAULT_TEXT_STORY,
          StorybookStories.FORM_TEXT_STORY
        ]
    );

    return MaterialApp(
        home: makeTopTabScreen(context, [
            RetainedTab(dashbookManager.dashBook),
            RetainedTab(storybook)
          ]
        ),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        )
    );
  }

  //============================================================================
  // Widget Methods
  //============================================================================

  Widget makeTopTabScreen(BuildContext context, List<Widget> tabs) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: makeTopTabBar(),
        body: TabBarView(
          children: tabs
        ),
      ),
    );
  }

  Widget makeTopTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(74.0),
      child: SafeArea(
        child: AppBar(
            flexibleSpace: makeTabBar()
        ),
      ),
    );
  }

  Widget makeTabBar() {
    return TabBar(
        tabs: [
          Tab(icon: Icon(Icons.book), text: "Dashbook"),
          Tab(icon: Icon(Icons.book), text: "Storybook")
        ]
    );
  }
}
