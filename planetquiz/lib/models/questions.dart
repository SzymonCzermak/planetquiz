import 'package:planetquiz/models/question.dart';

import 'question.dart';

const List<Question> questions = [
  Question(
    question: 'Kto zajmuje sie eksplozjami w fimie?',
    correctAnswerIndex: 1,
    options: [
      'a) Piroman',
      'b) Pirotechnik',
      'c) Prokurator',
      'd) Piroznawca',
    ],
  ),
  Question(
    question: 'Gdzie znajdują się Alvernia Planet?',
    correctAnswerIndex: 2,
    options: [
      'a) W Warszawie',
      'b) W Krakowie',
      'c) W Nieporazie',
      'd) W Gdańsku',
    ],
  ),
  Question(
    question: 'Kto założył Alvernia Studios?',
    correctAnswerIndex: 0,
    options: [
      'a) Stanisław Tyczyński',
      'b) Roman Polański',
      'c) Marek Serafiński',
      'd) Stanisław Lem',
    ],
  ),
  Question(
    question: 'Co to jest green screen?',
    correctAnswerIndex: 2,
    options: [
      'a) Technika malowania tła.',
      'b) Niebieskie tło',
      'c) Technika obróbki obrazu',
      'd) Ekran dotykowy',
    ],
  ),
  Question(
    question: 'Co to jest rekwizyt?',
    correctAnswerIndex: 1,
    options: [
      'a) Nazwa efektu specjalnego.',
      'b) Element scenografii.',
      'c) To inaczej sceniariusz.',
      'd) Technika montażu.',
    ],
  ),
  Question(
    question: 'Reżyserem jest:',
    correctAnswerIndex: 2,
    options: [
      'a) Osoba pisząca scenariusz.',
      'b) Aktor głównej roli.',
      'c) Autor filmu.',
      'd) Specjalista od efektów.',
    ],
  ),
  Question(
    question: 'Czym jest scenariusz?',
    correctAnswerIndex: 2,
    options: [
      'a) Lista aktorów.',
      'b) Plan dekoracji.',
      'c) Zarys akcji i dialogów.',
      'd) Instrukcje dla oświetlenia.',
    ],
  ),
  Question(
    question:
        'Jaki gatunek filmowy najlepiej opisuje film "Akademia Pana Kleksa"?',
    correctAnswerIndex: 3,
    options: [
      'a) Dramat',
      'b) Komedia',
      'c) Horror',
      'd) Przygodowy',
    ],
  ),
  Question(
    question: 'Do czego słuzy studio ze zdjęcia?',
    correctAnswerIndex: 2,
    options: [
      'a) Do nagrywania foleyów',
      'b) Do nagrywania kwesti aktorów',
      'c) Do nagrywania muzyki',
      'd) Do nagrywania układów tanecznych',
    ],
    imageUrl: 'assets/zdjQuiz/k1.jpg',
  ),
  Question(
    question: 'Czego obrazek widzisz?',
    correctAnswerIndex: 0,
    options: [
      'a) Studio postprodukcji dzwięku',
      'b) Kino',
      'c) Sala konferencyjna',
      'd) Sala pokazowa',
    ],
    imageUrl: 'assets/zdjQuiz/k7.jpg',
  ),
  Question(
    question: 'Co to jest broń butaforska?',
    correctAnswerIndex: 1,
    options: [
      'a) Broń niebezpieczna',
      'b) Broń bezpieczna',
      'c) Broń odbezpieczona',
      'd) Broń zabezpieczona',
    ],
  ),
  Question(
    question: 'Co to jest muzyka imanentna?',
    correctAnswerIndex: 3,
    options: [
      'a) Po prostu muzyka filmowa',
      'b) Muzyka z duza ilością basu',
      'c) Muzyka zewnętrznaa',
      'd) Muzyka wewnętrzna',
    ],
  ),
  Question(
    question: 'Kto zaprojektował Ksenomorfa?',
    correctAnswerIndex: 1,
    options: [
      'a) Szymon Wydra',
      'b) Hans Rudolf Giger',
      'c) Patryk Kierowik',
      'd) Sandro Botticelli',
    ],
  ),
  Question(
    question: 'Kto zaprojektował Ksenomorfa?',
    correctAnswerIndex: 1,
    options: [
      'a) Szymon Wydra',
      'b) Hans Rudolf Giger',
      'c) Patryk Kierowik',
      'd) Sandro Botticelli',
    ],
  ),
  Question(
    question: 'Ile jest wszystkich kopuł w Alvernia Planet?',
    correctAnswerIndex: 2,
    options: [
      'a) 6',
      'b) 9',
      'c) 13',
      'd) 14',
    ],
  ),
];



Map<String, List<Question>> roleQuestions = {
  'KinoManiak': [
    Question(
      question: 'Który film zdobył Oscara za najlepszy film w 1994 roku?',
      correctAnswerIndex: 0,
      options: [
        'a) Forrest Gump',
        'b) Pulp Fiction',
        'c) The Shawshank Redemption',
        'd) Quiz Show',
      ],
    ),
    Question(
      question: 'Kto zagrał rolę Jokera w filmie "The Dark Knight" (2008)?',
      correctAnswerIndex: 2,
      options: [
        'a) Jack Nicholson',
        'b) Jared Leto',
        'c) Heath Ledger',
        'd) Joaquin Phoenix',
      ],
    ),
    Question(
      question: 'Który reżyser jest znany z takich filmów jak "Inception", "Interstellar" i "Dunkirk"?',
      correctAnswerIndex: 1,
      options: [
        'a) Steven Spielberg',
        'b) Christopher Nolan',
        'c) Quentin Tarantino',
        'd) Martin Scorsese',
      ],
    ),
  ],
  'Magik Obiektywu': [
    Question(
      question: 'Który obiektyw jest idealny do fotografii portretowej?',
      correctAnswerIndex: 1,
      options: [
        'a) Szerokokątny 16mm',
        'b) Stałoogniskowy 85mm',
        'c) Teleobiektyw 200mm',
        'd) Makro 100mm',
      ],
    ),
    Question(
      question: 'Która technika fotografii polega na długim czasie naświetlania?',
      correctAnswerIndex: 0,
      options: [
        'a) Long exposure',
        'b) HDR',
        'c) Panorama',
        'd) Bokeh',
      ],
    ),
    Question(
      question: 'Który z poniższych fotografów jest znany z fotografii wojennej?',
      correctAnswerIndex: 3,
      options: [
        'a) Ansel Adams',
        'b) Richard Avedon',
        'c) Annie Leibovitz',
        'd) Robert Capa',
      ],
    ),
  ],
  'Malarka Scen': [
    Question(
      question: 'Która technika malarska polega na nanoszeniu farby na suchą powierzchnię?',
      correctAnswerIndex: 2,
      options: [
        'a) Akwarela',
        'b) Fresk',
        'c) Tempera',
        'd) Enkaustyka',
      ],
    ),
    Question(
      question: 'Jak nazywa się sztuka malowania na mokrym tynku?',
      correctAnswerIndex: 1,
      options: [
        'a) Impasto',
        'b) Fresk',
        'c) Grisaille',
        'd) Pointylizm',
      ],
    ),
    Question(
      question: 'Która artystka jest znana z dużych kwiatowych obrazów i stylu modernistycznego?',
      correctAnswerIndex: 3,
      options: [
        'a) Frida Kahlo',
        'b) Yayoi Kusama',
        'c) Mary Cassatt',
        'd) Georgia O\'Keeffe',
      ],
    ),
  ],
  'Dźwiękowiec': [
    Question(
      question: 'Która technika polega na nagrywaniu dźwięku bezpośrednio na planie filmowym?',
      correctAnswerIndex: 0,
      options: [
        'a) Foley',
        'b) ADR',
        'c) Looping',
        'd) Mixing',
      ],
    ),
    Question(
      question: 'Który mikrofon jest najczęściej używany do nagrywania dialogów?',
      correctAnswerIndex: 1,
      options: [
        'a) Dynamiczny',
        'b) Pojemnościowy',
        'c) Wstęgowy',
        'd) Shotgun',
      ],
    ),
    Question(
      question: 'Co to jest postprodukcja dźwięku?',
      correctAnswerIndex: 2,
      options: [
        'a) Proces nagrywania dialogów',
        'b) Nagrywanie efektów dźwiękowych',
        'c) Obróbka i miksowanie dźwięku po nagraniu',
        'd) Nagrywanie muzyki do filmu',
      ],
    ),
  ],
  'Scenograf': [
    Question(
      question: 'Która technika polega na tworzeniu modelu scenografii w miniaturze?',
      correctAnswerIndex: 3,
      options: [
        'a) Scenografia cyfrowa',
        'b) Matte painting',
        'c) Green screen',
        'd) Maquette',
      ],
    ),
    Question(
      question: 'Który materiał jest często używany do budowy scenografii?',
      correctAnswerIndex: 0,
      options: [
        'a) Styropian',
        'b) Metal',
        'c) Tkanina',
        'd) Plastik',
      ],
    ),
    Question(
      question: 'Który z poniższych jest znanym scenografem?',
      correctAnswerIndex: 1,
      options: [
        'a) Hans Zimmer',
        'b) Dante Ferretti',
        'c) Quentin Tarantino',
        'd) Ridley Scott',
      ],
    ),
  ],
};



