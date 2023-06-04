class Story {
  String title;
  List<String> choices;

  Story({required this.title, required this.choices});
}

class StoryNode extends Story {
  List<StoryNode> children;

  StoryNode(
      {required String title,
      required List<String> choices,
      required this.children})
      : super(title: title, choices: choices);
}
