/// Since the API from [https://unsplash.com/] only allows `50` requests
/// in an hour, therefore this controller is for providing dummy data and hence reducing the overall production time.
///
/// Main API for this dummy controller is available here:
/// [https://www.breakingbadapi.com/api/characters?limit=30]

class CharacterModel {
  final int id;
  final String name;
  final String birthday;
  final String status;
  final String pictureUrl;

  CharacterModel({
    required this.id,
    required this.name,
    required this.birthday,
    required this.status,
    required this.pictureUrl,
  });
}

List<CharacterModel> breakingBadData = [
  CharacterModel(
    id: 1,
    name: "Walter White",
    birthday: "09-07-1958",
    status: "Presumed dead",
    pictureUrl:
        "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
  ),
  CharacterModel(
    id: 2,
    name: "Jesse Pinkman",
    birthday: "09-24-1984",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441",
  ),
  CharacterModel(
    id: 3,
    name: "Skyler White",
    birthday: "08-11-1970",
    status: "Alive",
    pictureUrl:
        "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg",
  ),
  CharacterModel(
    id: 4,
    name: "Walter White Jr.",
    birthday: "07-08-1993",
    status: "Alive",
    pictureUrl:
        "https://media1.popsugar-assets.com/files/thumbor/WeLUSvbAMS_GL4iELYAUzu7Bpv0/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2018/01/12/910/n/1922283/fb758e62b5daf3c9_TCDBRBA_EC011/i/RJ-Mitte-Walter-White-Jr.jpg",
  ),
  CharacterModel(
    id: 5,
    name: "Henry Schrader",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/b/b7/HankS5.jpg/revision/latest/scale-to-width-down/700?cb=20120620014136",
  ),
  CharacterModel(
    id: 6,
    name: "Marie Schrader",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/1/10/Season_2_-_Marie.jpg/revision/latest?cb=20120617211645",
  ),
  CharacterModel(
    id: 7,
    name: "Mike Ehrmantraut",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_mike-ehrmantraut-lg.jpg",
  ),
  CharacterModel(
    id: 8,
    name: "Saul Goodman",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/1/16/Saul_Goodman.jpg/revision/latest?cb=20120704065846",
  ),
  CharacterModel(
    id: 9,
    name: "Gustavo Fring",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/1/1f/BCS_S4_Gustavo_Fring.jpg/revision/latest?cb=20180824195925",
  ),
  CharacterModel(
    id: 10,
    name: "Hector Salamanca",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/b/b4/Hector_BCS.jpg/revision/latest?cb=20170810091606",
  ),
  CharacterModel(
    id: 11,
    name: "Domingo Molina",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/e/e7/Krazy8.png/revision/latest?cb=20130208041554",
  ),
  CharacterModel(
    id: 12,
    name: "Tuco Salamanca",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/a/a7/Tuco_BCS.jpg/revision/latest?cb=20170810082445",
  ),
  CharacterModel(
    id: 13,
    name: "Marco & Leonel Salamanca",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_the-cousins-lg.jpg",
  ),
  CharacterModel(
    id: 14,
    name: "Lydia Rodarte-Quayle",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://media1.popsugar-assets.com/files/thumbor/wERDST0TUb-iHCSb2r5ZpsvaZLo/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/07/17/675/n/1922283/fae2f583f04bb80f_Laura-Fraser-is-back-as-Lydia-Rodarte-Quayle_gallery_primary/i/Laura-Fraser-Lydia-Rodarte-Quayle.jpg",
  ),
  CharacterModel(
    id: 15,
    name: "Todd Alquist",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/Todd_brba5b.png/revision/latest?cb=20130717134303",
  ),
  CharacterModel(
    id: 16,
    name: "Jane Margolis",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/b/b4/Jane.jpg/revision/latest?cb=20090621233653",
  ),
  CharacterModel(
    id: 17,
    name: "Skinny Pete",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breaking-bad-tv/images/c/ce/Sp.png/revision/latest?cb=20121016143623",
  ),
  CharacterModel(
    id: 18,
    name: "Brandon Mayhew",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_badger-lg.jpg",
  ),
  CharacterModel(
    id: 19,
    name: "Huell Babineaux",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/c/c1/4x11_-_Huell.png/revision/latest?cb=20130913100459&path-prefix=es",
  ),
  CharacterModel(
    id: 20,
    name: "Steven Gomez",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_steven-gomez-lg.jpg",
  ),
  CharacterModel(
    id: 21,
    name: "Theodore Beneke",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/b/bd/Cast_bb_700x1000_todd-beneke-lg.jpg/revision/latest?cb=20170723165057",
  ),
  CharacterModel(
    id: 22,
    name: "Gale Boetticher",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_gale-boetticher-lg.jpg",
  ),
  CharacterModel(
    id: 23,
    name: "Andrea Cantillo",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/5/51/Andrea_-_To%27hajilee.png/revision/latest?cb=20131025094457",
  ),
  CharacterModel(
    id: 24,
    name: "Brock Cantillo",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/9/97/Brock.png/revision/latest?cb=20170725193144",
  ),
  CharacterModel(
    id: 25,
    name: "Carmen Molina",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/d/de/Carmen.JPG/revision/latest?cb=20100410125233",
  ),
  CharacterModel(
    id: 26,
    name: "Gretchen Schwartz",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/5/5e/Gretchen_Schwartz.png/revision/latest?cb=20131005103735&path-prefix=es",
  ),
  CharacterModel(
    id: 27,
    name: "Elliot Schwartz",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/8/8a/Elliott_Schwartz.png/revision/latest?cb=20131005103743&path-prefix=es",
  ),
  CharacterModel(
    id: 28,
    name: "Gonzo",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/d/d6/Gonzo.JPG/revision/latest?cb=20100415212944",
  ),
  CharacterModel(
    id: 29,
    name: "Christian Ortgea",
    birthday: "Unknown",
    status: "Deceased",
    pictureUrl:
        "https://res.cloudinary.com/dwvrok1le/image/upload/v1540314304/c8acek3pimb0hb4efrvf.jpg",
  ),
  CharacterModel(
    id: 30,
    name: "Mrs. Pinkman",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/a/a2/Tess_Harper.jpg/revision/latest?cb=20120923235754",
  ),
  CharacterModel(
    id: 31,
    name: "Adam Pinkman",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/c/c9/AdamPinkman.png/revision/latest?cb=20141117180836&path-prefix=es",
  ),
  CharacterModel(
    id: 32,
    name: "Jake Pinkman",
    birthday: "Unknown",
    status: "Alive",
    pictureUrl:
        "https://vignette.wikia.nocookie.net/breakingbad/images/a/a4/Jake.jpg/revision/latest?cb=20121214201656&path-prefix=de",
  ),
];
