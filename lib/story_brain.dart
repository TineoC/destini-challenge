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

  List<String> getChoices(Story story) {
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
}
//TODO: Step 23 - Use the storyNumber property inside getStory(), getChoice1() and getChoice2() so that it gets the updated story and choices rather than always just the first (0th) one.

//TODO: Step 25 - Change the storyNumber property into a private property so that only story_brain.dart has access to it. You can do this by right clicking on the name (storyNumber) and selecting Refactor -> Rename to make the change across all the places where it's used.

//TODO: Step 27 - Create a method called buttonShouldBeVisible() which checks to see if storyNumber is 0 or 1 or 2 (when both buttons should show choices) and return true if that is the case, else it should return false.
