import 'package:destiny/story.dart';
import 'package:destiny/story_data.dart';

class StoryBrain {
  late StoryNode _rootNode;
  late StoryNode _currentNode;

  StoryBrain() {
    _rootNode = _currentNode = StoryData.getRootNode();
  }

  String getStory() {
    return _currentNode.title;
  }

  List<String> getChoices() {
    return _currentNode.choices;
  }

  void nextStory(int choiceIndex) {
    List<StoryNode> children = _currentNode.children;

    if (choiceIndex < 0 || choiceIndex >= children.length) return;

    _currentNode = children[choiceIndex];
  }

  bool isEndNode() {
    return _currentNode.children.isEmpty;
  }

  void _restart() {
    _currentNode = _rootNode;
  }

  bool buttonShouldBeVisible() {
    return true;
  }
}
