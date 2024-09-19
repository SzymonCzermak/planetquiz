import 'package:planetquiz/models/question.dart';

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
  Question(
   question: 'Kto jest reżyserem filmu ,,11 minut’’?',
   correctAnswerIndex: 0,
   options: [
     'a) Jerzy Skolimowski',
     'b)Dave Bautista',
     'c) Tomasz Kot',
     'd) Johnny Deep',
   ],
 ),
 Question(
   question: 'Jaki rodzaj dźwięku jest nagrywany na planie filmowym?',
   correctAnswerIndex: 3,
   options: [
     'a) muzyka',
     'b) szumy',
     'c) gwary',
     'd) dialogi',
   ],
 ),
Question(
   question: 'Czym zajmują się kaskaderzy?',
   correctAnswerIndex: 1,
   options: [
     'a) zastępują aktora, kiedy jest chory',
     'b) zajmują się wykonywaniem niebezpiecznych scen w filmach',
     'c) projektują kostiumy i scenografię do filmów ',
     'd) piszą scenariusze do filmów',
   ],
 ),
Question(
   question: 'Jak nazywa się osoba,która inwestuje w powstanie filmu?',
   correctAnswerIndex: 2,
   options: [
     'a) kierownik',
     'b)reżyser',
     'c) producent',
     'd) księgowy',
   ],
 ),
Question(
   question: 'Jaka jest rola scenarzysty podczas produkcji filmu?',
   correctAnswerIndex: 1,
   options: [
     'a) tworzy scenariusz',
     'b)tworzy scenografię',
     'c) tworzy efekty specjalne w filmie ',
     'd)zarządza budżetem i harmonogramem produkcji filmu',
   ],
 ),
Question(
   question: 'Kto jest reżyserem filmu ,,11 minut’’?',
   correctAnswerIndex: 0,
   options: [
     'a) Jerzy Skolimowski',
     'b) Dave Bautista',
     'c) Tomasz Kot',
     'd) Johnny Deep',
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
    Question(
     question: 'Jak nazywa się fikcyjna planeta na której rozgrywa się akcja filmu ,,Avatar’’?',
     correctAnswerIndex: 2,
     options: [
       'a) Prada',
       'b) Zephyron',
       'c) Pandora',
       'd) Lyriath',
     ],
   ),
   Question(
   question: 'Jak nazywał się słynny czarodziej z białą brodą w filmie ,,Władca Pierścieni’’?',
   correctAnswerIndex: 0,
   options: [
     'a) Gandalf',
     'b) Voldemort',
     'c) Hagrid',
     'd) John',
      ],
    ),
    Question(
      question: 'Kto napisał muzykę do filmu ,, Król Lew’’?',
      correctAnswerIndex: 3,
      options: [
        'a) John Williams',
        'b) Wojciech Kilar',
        'c) Howard Shore',
        'd) Hans Zimmer',
      ],
    ),
    Question(
   question: 'W filmie ,,Akademia Pana Kleksa’’, jaki kolor mają włosy Ambrożego Kleksa ?',
   correctAnswerIndex: 2,
   options: [
     'a) blond',
     'b) czarne',
     'c) rude',
     'd) brązowe',
      ],
    ),
    Question(
      question: 'W filmie ,,Narnia: Lew, Czarownica i Stara Szafa’’, jakie imię nosi wilk, który jest szefem tajnej policji Białej Czarownicy ?',
      correctAnswerIndex: 0,
      options: [
        'a) Maugrim',
        'b) Mufasa',
        'c) Skaza',
        'd) Zazu',
      ],
    ),
    Question(
   question: 'W filmie ,, Charlie i fabryka czekolady’’, jakie jest imię i nazwisko twórcy fabryki czekolady ?',
   correctAnswerIndex: 1,
   options: [
     'a) Michael Davis',
     'b) Willy Wonka',
     'c) Roberth Smith',
     'd) John Applepie',
   ],
 ),
    Question(
      question: 'W filmie ,, Igrzyska Śmierci’’, w jakiej dzielnicy mieszka Katniss Everdeen ?',
      correctAnswerIndex: 2,
      options: [
        'a) Dystrykt 20',
        'b) Dystrykt 37',
        'c) Dystrykt 12',
        'd) Dystrykt 11',
      ],
    ),
    Question(
      question: 'W filmie ,,Więzień Labiryntu’’, jakie imię nosi główny bohater?',
      correctAnswerIndex: 1,
      options: [
        'a) Lucas',
        'b) Thomas',
        'c) Carol',
        'd) Rick',
      ],
    ),
    Question(
      question: 'Kto skomponował słynną muzykę do filmowej serii ,, Gwiezdne Wojny’’?',
      correctAnswerIndex: 3,
      options: [
        'a) Hans Zimmer',
        'b) Ennio Morricone',
        'c) Howard Shore',
        'd) John Williams',
      ],
    ),


    Question(
      question: 'Kto wyreżyserował film ,,Mary Poppins’’’?',
      correctAnswerIndex: 0,
      options: [
        'a) Robert Stevenson',
        'b) Steven Spielberg',
        'c) Christopher Nolan',
        'd) Quentin Tarantino',
      ],
    ),
    Question(
      question: 'W filmie ,, Strażnicy Galaktyki’’ jakie jest prawdziwe imię i nazwisko Star-Lorda?',
      correctAnswerIndex: 3,
      options: [
        'a) Tom Hank',
        'b) Robert Downey Jr.',
        'c) Brad Pitt',
        'd) Peter Jason Quill',
      ],
    ),
    Question(
      question: 'Który animowany film jako pierwszy w historii zdobył Oscara za najlepszy pełnometrażowy film animowany ?',
      correctAnswerIndex: 1,
      options: [
        'a) Toy Story ',
        'b) Shrek',
        'c) Król Lew',
        'd) Kraina Lodu ',
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
  Question(
    question: 'Jak nazywa się wartość określająca czułość matrycy aparatu na światło?',
    correctAnswerIndex: 0,
    options: [
      'a) ISO',
      'b) ABS',
      'c) SIO',
      'd) OSIS',
    ],
  ),
  Question(
    question: 'Jak nazywa się mechanizm w aparacie, który kontroluje czas, przez jaki światło pada na matrycę?',
    correctAnswerIndex: 2,
    options: [
      'a) przysłona',
      'b) autofokus',
      'c) migawka',
      'd) matryca',
    ],
  ),
  Question(
    question: 'Który polski fotograf był znany ze swoich prac dokumentalnych przedstawiających życie codzienne w Polsce w okresie PRL?',
    correctAnswerIndex: 3,
    options: [
      'a) Tomasz Gudzowaty',
      'b) Ryszard Horowitz',
      'c) Edward Hartwig',
      'd) Zofia Rydet',
    ],
  ),
  Question(
    question: 'Co to jest matryca w aparacie cyfrowym?',
    correctAnswerIndex: 3,
    options: [
      'a) przycisk do robienia zdjęć',
      'b) wyświetlacz aparatu',
      'c) bateria aparatu',
      'd) elementy zmieniające światło na sygnał cyfrowy',
    ],
  ),
  Question(
    question: 'Co to jest tryb makro ?',
    correctAnswerIndex: 1,
    options: [
      'a) tryb robienia zdjęć w nocy',
      'b) robienie zdjęć z bliska',
      'c) tryb nagrywania wideo',
      'd) tryb robienia zdjęć panoramicznych',
    ],
  ),
  Question(
    question: 'Co to jest format RAW?',
    correctAnswerIndex: 0,
    options: [
      'a) nieskompresowany format pliku',
      'b) rodzaj filtra fotograficznego',
      'c) format kompresji obrazu',
      'd) tryb automatycznego ustawiania ostrości',
    ],
  ),
  Question(
    question: 'Co oznacza skrót ISO w fotografii?',
    correctAnswerIndex: 2,
    options: [
      'a) intensywność światła obiektywu',
      'b) ilość pamięci aparatu ',
      'c) czułość matrycy na światło',
      'd) szybkość migawki',
    ],
  ),
  Question(
    question: 'Co robi autofokus?',
    correctAnswerIndex: 0,
    options: [
      'a) ustawia ostrość',
      'b) zmienia balans bieli',
      'c) reguluje czas naświetlania',
      'd) zmienia rozdzielczość zdjęć',
    ],
  ),
  Question(
    question: 'Co to jest balans bieli?',
    correctAnswerIndex: 1,
    options: [
      'a) zwiększa kontrast zdjęcia',
      'b) ustawienie naturalnych kolorów',
      'c) ustawia rozdzielczość zdjęcia',
      'd) zmienia jasność ekranu aparatu',
    ],
  ),
  Question(
    question: 'Który fotograf jest znany z portretów czarno-białych i serii ,,American West’’?',
    correctAnswerIndex: 2,
    options: [
      'a) Dorothea Lange',
      'b) Henri Cartier-Bresson',
      'c) Richard Avedon',
      'd) Steve McCurry',
    ],
  ),
  Question(
    question: 'Który polski fotograf jest znany z kreatywnych fotomontaży i pracy w dziedzinie fotografii reklamowej?',
    correctAnswerIndex: 3,
    options: [
      'a) Zofia Rydet',
      'b) Tomasz Gudzowaty',
      'c) Edward Hartwig',
      'd) Ryszard Horowitz',
    ],
  ),
  Question(
    question: 'Który brytyjski fotograf jest znany ze swoich portretów celebrytów i współpracy z magazynami Vogue i Harper’s Bazaar?',
    correctAnswerIndex: 0,
    options: [
      'a) David Bailey',
      'b) Ansel Adams',
      'c) Sebastiao Salgado',
      'd) Dorothea Lange',
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
    Question(
   question: 'Jak nazywał się włoski malarz i rzeźbiarz znany z dzieł takich jak ,,Dawid’’i ,,Pieta’’?',
   correctAnswerIndex: 0,
   options: [
     'a) Michał Anioł',
     'b) Edvard Munch',
     'c) Claude Monet',
     'd) Vincent van Gogh',
   ],
 ),
 Question(
   question: 'Jak nazywa się technika malarska w której artysta używa wosku zmieszanego z pigmentami do malowania na gorąco?',
   correctAnswerIndex: 1,
   options: [
     'a) akwarela',
     'b) enkaustyka',
     'c) gwasz',
     'd) tempera',
   ],
 ),
 Question(
   question: 'Jak nazywa się muzeum w Paryżu, w którym znajduje się obraz ,,Mona Lisa’’?',
   correctAnswerIndex: 2,
   options: [
     'a) Prado',
     'b) Tate Modern',
     'c) Luwr (Louvre)',
     'd) Guggenheim Museum',
   ],
 ),
 Question(
   question: 'Który artysta jest znany z wynalezienia techniki ,,sfumato’’, widocznej w obrazie ,,Mona Lisa’’?',
   correctAnswerIndex: 0,
   options: [
     'a) Leonardo da Vinci',
     'b) Michał Anioł',
     'c) Edvard Munch',
     'd) Claude Monet',
   ],
 ),
Question(
   question: 'Jak nazywa się technika malarska, w której farby olejne są nakładane na płótno przy użyciu noży malarskich, tworząc grube, teksturowane warstwy?',
   correctAnswerIndex: 3,
   options: [
     'a) fresk',
     'b) akwarela',
     'c) tempera',
     'd) impasto',
   ],
 ),
 Question(
   question: 'Jak nazywa się seria obrazów Claude’a Moneta przedstawiająca ten sam motyw wodnych lili, ukazująca zmieniające się warunki oświetleniowe i atmosferyczne ?',
   correctAnswerIndex: 0,
   options: [
     'a) ,,Nenufary’’',
     'b) ,,Impresja,wschód słońca’’',
     'c) ,,Katedra w Rouen’’',
     'd) ,,Stogi Siana’’',
   ],
 ),
 Question(
   question: 'Jak nazywa się obraz Stanisława Wyspiańskiego przedstawiający kobietę w białej sukni, siedzącą na tle polnych kwiatów?',
   correctAnswerIndex: 1,
   options: [
     'a) ,,Dziewczynka z chryzantemami’’',
     'b) ,,Portret Elizy Pareńskiej’’',
     'c) ,,Madonna z Dzieciątkiem’’',
     'd) ,,Róże i dziewczyna’’',
   ],
 ),
 Question(
   question: 'Który polski malarz jest autorem słynnego obrazu ,,Babie lato’’ przedstawiającego kobietę w polu w trakcie jesieni’?',
   correctAnswerIndex: 2,
   options: [
     'a) Jan Matejko',
     'b) Stanisław Wyspiański',
     'c) Józef Chełmoński',
     'd) Jacek Malczewski',
   ],
 ),
 Question(
   question: 'Jak nazywa się rodzaj płótna używanego najczęściej do malarstwa olejnego i akrylowego, znany ze swojej trwałości i odporności na rozciąganie?',
   correctAnswerIndex: 3,
   options: [
     'a) płótno bawełniane',
     'b) karton',
     'c) papier ryżowy',
     'd) płótno lniane',
   ],
 ),
Question(
   question: 'Jak nazywają się farby, które są mieszane z olejem lnianym i schną bardzo wolno, co pozwala na długą pracę nad obrazem?',
   correctAnswerIndex: 0,
   options: [
     'a) farby olejne',
     'b) farby akrylowe',
     'c) farby akwarelowe',
     'd) farby temperowe',
   ],
 ),
Question(
   question: 'Jak nazywają się farby, które są mieszane z woskiem pszczelim, a następnie podgrzewane i nakładane na podłoże’’?',
   correctAnswerIndex: 1,
   options: [
     'a) farby olejne',
     'b) farby enkaustyczne',
     'c) farby temperowe',
     'd) farby akrylowe',
   ],
 ),
Question(
   question: 'Kto namalował ,, Dziewczynkę z chryzantemami’’?',
   correctAnswerIndex: 2,
   options: [
     'a) Zofia Stryjeńska',
     'b) Tamara Łempicka',
     'c) Olga Boznańska',
     'd) Hanna Rudzka-Cybisowa',
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
    Question(
   question: 'Jak nazywa się proces dostosowania poziomów dźwięku, takich jak dialogi, efekty dźwiękowe i muzyka, aby tworzyć zrównoważoną ścieżkę dźwiękową',
correctAnswerIndex: 1,  
options: [
     'a) foley',
     'b) ADR',
     'c) Sound editing',
     'd) Sound mixing',
   ],
 ),
 Question(
   question: 'Jak nazywa się urządzenie używane na planie filmowym do nagrywania dźwięku z dużej odległości, zazwyczaj z bardzo wąskim polem odbioru?',
   correctAnswerIndex: 1,
   options: [
     'a) Lavalier microphone',
     'b) Shotgun microphone',
     'c) Boom microphone',
     'd) Parabolic microphone',
   ],
 ),
Question(
   question: 'Która technika nagrywania dźwięku polega na rejestrowaniu dźwięku w czasie rzeczywistym na planie filmowym?',
   correctAnswerIndex: 2,
   options: [
     'a) dubbing',
     'b) foley',
     'c) nagranie synchroniczne',
     'd) ADR',
   ],
 ),
Question(
   question: 'Jak nazywa się mikrofon używany najczęściej do nagrywania dialogów na planie filmowym, umieszczony na długim wysięgniku?',
   correctAnswerIndex: 3,
   options: [
     'a) mikrofon dynamiczny’',
     'b) mikrofon pojemnościowy',
     'c) mikrofon krawatowy',
     'd) mikrofon boom',
   ],
 ),
Question(
   question: 'Który z poniższych programów jest popularnym oprogramowaniem do edycji dźwięku w produkcji filmowej?',
   correctAnswerIndex: 2,
   options: [
     'a) Photoshop',
     'b) Audacity',
     'c) Pro Tools',
     'd) Premiere Pro’',
   ],
 ),
Question(
   question: 'Co to jest ,,room tone’’ w kontekście nagrywania dźwięku?',
   correctAnswerIndex: 1,
   options: [
     'a) specjalny efekt dźwiękowy',
     'b) nagranie tła akustycznego miejsca, w którym nagrywane są dialogi',
     'c) edytowanie dźwięku dialogów',
     'd) synchronizacja dźwięku z obrazem',
   ],
 ),
Question(
   question: 'Co oznacza skrót DAW w kontekście produkcji dźwiękowej?',
   correctAnswerIndex: 0,
   options: [
     'a) Digital Audio Workstation',
     'b) Dynamic Audio Wave',
     'c) Direct Audio Writing',
     'd) Digital Acoustic Workflow',
   ],
 ),
Question(
   question: 'Które z poniższych narzędzi jest używane do monitorowania poziomów dźwięku podczas nagrywania?',
   correctAnswerIndex: 3,
   options: [
     'a) kompresor',
     'b) equalizer',
     'c) limiter',
     'd) PPM (peak program meter)',
   ],
 ),






 Question(
   question: 'Która technika nagrywania dźwięku polega na użyciu wielu mikrofonów rozmieszczonych wokół sceny, aby uchwycić dźwięk przestrzenny?',
   correctAnswerIndex: 3,
   options: [
     'a) nagranie binauralne',
     'b) nagranie mono',
     'c) nagranie stereo',
     'd) sorround sound recording',
   ],
 ),
Question(
   question: 'Który z poniższych terminów odnosi się do niepożądanych sygnałów dźwiękowych, które przenikają do nagrania?',
   correctAnswerIndex: 3,
   options: [
     'a) echo',
     'b) szumy',
     'c) reverb',
     'd) crosstalk',
   ],
 ),
Question(
   question: 'Co to jest ,,panning’’ w kontekście nagrywania dźwięku?',
   correctAnswerIndex: 1,
   options: [
     'a) regulacja poziomów częstotliwości ',
     'b) przemieszczanie dźwięku w polu stereo',
     'c) redukcja szumów',
     'd) dodawanie efektów dźwiękowych',
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
Question(
   question: 'Który polski scenograf otrzymał Oscara za pracę nad filmem ,, Lista Schindlera ?',
   correctAnswerIndex: 0,
   options: [
     'a) Allan Starski',
     'b) Janusz Kamiński',
     'c) Andrzej Wajda',
     'd) Roman Polański’',
   ],
 ),
Question(
   question: 'Jak scenograf może wpływać na nastrój i emocje widzów podczas spektaklu?',
   correctAnswerIndex: 3,
   options: [
     'a) poprzez kontrolowanie prędkości, z jaką aktorzy poruszają się po scenie',
     'b) poprzez pisanie monologów dla głównych postaci ',
     'c) poprzez tworzenie muzyki do spektaklu',
     'd) poprzez dobór odpowiednich kolorów, tekstur i układu przestrzennego, które mogą wywoływać odpowiednie emocje ',
   ],
 ),
Question(
   question: 'Który film animowany wyróżnia się szczególnie starannie zaprojektowaną scenografią, inspirowaną skandynawskimi krajobrazami i kulturą?',
   correctAnswerIndex: 2,
   options: [
     'a) ,,Toy Story’’',
     'b) ,,Król Lew’’',
     'c) ,,Kraina Lodu’’',
     'd) ,,Gdzie jest Nemo ?’’',
   ],
 ),
Question(
   question: 'Który z tych filmów ma scenografię osadzoną w czasach wiktoriańskich, przedstawiającą mroczne, ale jednocześnie baśniowe miasto ?',
   correctAnswerIndex: 3,
   options: [
     'a) ,,Zaplątani’’',
     'b) ,,Koralina i Tajemnicze Drzwi’’',
     'c) ,,Piękna i Bestia’’',
     'd) ,,Gnijąca Panna Młoda’’',
   ],
 ),
Question(
   question: 'Który scenograf pracował przy filmie ,,Kraina Lodu’’,projektując m.in. lodowy zamek Elsy?',
   correctAnswerIndex: 2,
   options: [
     'a) Ralph Eggleston',
     'b) Tim Burton',
     'c) Michael Giaimo',
     'd) Pete Docter',
   ],
 ),
Question(
   question: 'Który scenograf zdobył Oscara za pracę nad scenografią w filmie animowanym ,,Coco’’, który jest znany ze swojej bogatej estetyki inspirowanej kulturą meksykańską?',
   correctAnswerIndex: 0,
   options: [
     'a) Harley Jessup',
     'b) Ralph Eggleston',
     'c) Rick Heinrichs',
     'd) Tim Burton',
   ],
 ),
Question(
   question: 'Który film animowany zyskał uznanie za szczegółową scenografię przedstawiającą życie pod wodą,w tym rafy koralowe i podwodne miasta ?',
   correctAnswerIndex: 1,
   options: [
     'a) ,,Mała Syrenka’’',
     'b) ,,Gdzie jest Nemo? ’’',
     'c) ,,Atlantyda: Zaginiony ląd’’',
     'd) ,,Vaiana:Skarb Oceanu’’',
   ],
 ),
Question(
   question: 'Jak twórcy filmu ,, Piękna i Bestia’’ zaprojektowali zaczrowaną różę, aby symbolizowała upływający czas i nadzieję?',
   correctAnswerIndex: 2,
   options: [
     'a) róża została stworzona jako model 3D, a następnie zeskanowana',
     'b) wykorzystali prawdziwą różę, którą później cyfrowo wkomponowali w film',
     'c) użyli animacji komputerowej, aby róża stopniowo traciłą płatki w miarę upływu fabuły',
     'd) namalowali różę na każdej klatce filmu ręcznie',
   ],
 ),
Question(
   question: 'Jak stworzono rekwizyty w ,,Toy Story’’ ?',
   correctAnswerIndex: 3,
   options: [
     'a) rysowano ręcznie',
     'b) generowano komputerowo',
     'c) używano prawdziwych zabawek',
     'd) skanowano modele do komputera',
   ],
 ),


 Question(
   question: 'Który film korzystał z gotowej scenografii, filmując sceny w prawdziwej szkole w Portland?',
   correctAnswerIndex: 0,
   options: [
     'a) ,,Zmierzch’’',
     'b) ,,Harry Potter’’',
     'c) ,,Igrzyska Śmierci’’',
     'd) ,,Labirynt’’',
   ],
 ),
Question(
   question: 'Jak nazywa się obraz Stanisława Wyspiańskiego przedstawiający kobietę w białej sukni, siedzącą na tle polnych kwiatów?',
   correctAnswerIndex: 1,
   options: [
     'a) ,,Dziewczynka z chryzantemami’’',
     'b) ,,Portret Elizy Pareńskiej’’',
     'c) ,,Madonna z Dzieciątkiem’’',
     'd) ,,Róże i dziewczyna’’',
   ],
 ),
Question(
   question: 'W jakim filmie wykorzystano gotowe tereny naturalne, takie jak lasy,góry, jako główną scenografię zamiast tworzyć ją w studio ?',
   correctAnswerIndex: 1,
   options: [
     'a) ,,Zmierzch’’',
     'b) ,,Igrzyska Śmierci’’',
     'c) ,,Niezgodna’’',
     'd) ,,Harry Potter’’',
   ],
 ),
Question(
   question: 'Kto pracował jako scenograf przy filmie ,,Spider-Man:Homecoming’’, nadając mu autentyczny, miejską atmosferę Nowego Yorku ?',
   correctAnswerIndex: 2,
   options: [
     'a) Philip Messina',
     'b) Dante Ferretti',
     'c) Oliver Scholl',
     'd) Stuart Craig',
   ],
 ),
  ],
};



