import 'dart:io';

//Mixin
mixin Greeting {
  String greeting() => "🔥🎉🥳🔥🎉🥳🔥🎉🥳";
}

class Candidate with Greeting {
  String _name;
  int _score;

  static int _maxScore = 0;
  static Candidate? _firstCandidate;

  // Initializer list + default parameter
  Candidate._(String givenName, [int score = 0])
      //Assertion
      : assert(givenName.isNotEmpty),
        _name = givenName,
        _score = score;

  //Factory
  factory Candidate(String givenName) {
    Candidate c = Candidate._(givenName);
    _firstCandidate ??= c;

    return c;
  }

  String get name => _name;
  int get score => _score;

  static Candidate? get firstCandidate => _firstCandidate;
  static int get maxScore => _maxScore;

  void scoreIncrement() {
    _score++;

    if (_score > _maxScore) {
      _maxScore = _score;
    }
  }
}

void main() {
  var separator = () => print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
  //Collection
  List<Candidate> listOfCandidates = [];

  print("The election begins!");
  separator();

  //Syntactic sugar, verify if number is not null, else, number is 1
  int? numberOfCandidates;
  do {
    stdout.write("Please provide the number of CANDIDATES: ");
    String numCand = stdin.readLineSync() ?? '';
    numberOfCandidates = int.tryParse(numCand);
  } while (numberOfCandidates == null || numberOfCandidates < 1);
  separator();

  while (listOfCandidates.length != numberOfCandidates) {
    stdout.write("Please provide the NAME of the candidate: ");
    String candidateName = stdin.readLineSync() ?? '';
    if (candidateName.trim().isEmpty) {
      print("Please enter candidate name");
      continue;
    }
    Candidate candidate = Candidate(candidateName.trim());
    listOfCandidates.add(candidate);
  }
  separator();
  int? numberOfVoters;
  do {
    stdout.write("Please provide the number of VOTERS: ");
    String numVote = stdin.readLineSync() ?? '';
    numberOfVoters = int.tryParse(numVote);
  } while (numberOfVoters == null);
  separator();
  print("Please provide the votes: ");
  int i = 1;
  listOfCandidates.forEach((element) {
    print("${i++} for ${element.name}");
  });

  //Collections
  for (int i = 1; i <= numberOfVoters; i++) {
    int? vote;
    do {
      stdout.write("Voter $i: ");
      String voteText = stdin.readLineSync() ?? '';
      vote = int.tryParse(voteText);
    } while (vote == null || vote <= 0 || vote > listOfCandidates.length);

    (listOfCandidates[vote - 1]).scoreIncrement();
  }

  print("The winners are: ");
  separator();
  //Filter + замикання
  listOfCandidates
      .where((candidate) => candidate.score == Candidate.maxScore)
      .forEach((candidate) {
    print("${candidate.name} ${candidate.greeting()}");
  });
  // print(
  //     "First registered candidates was: ${Candidate.firstCandidate?.name ?? 'none'}");
}
