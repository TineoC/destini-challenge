import 'package:destiny/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain _storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    final List<String> choices = _storyBrain.getChoices();

    // ignore: unused_local_variable
    var [firstChoice, secondChoice, ...rest] = choices;

    const choiceStyles = TextStyle(fontSize: 20.0, color: Colors.white);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.cover,
                opacity: 0.6)),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    _storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    showNextStory(0);
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  child: Text(
                    firstChoice,
                    style: choiceStyles,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: _storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      showNextStory(1);
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    child: Text(
                      secondChoice,
                      style: choiceStyles,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextStory(int index) {
    setState(() {
      if (_storyBrain.isEndNode()) {
        _storyBrain.restart();
        return;
      }

      _storyBrain.nextStory(index);
    });
  }
}
