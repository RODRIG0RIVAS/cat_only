import 'package:cat_api/api/domain/entities/cat_raw/cat_raw.dart';

const String catRawListJson =
    '''[{"id":"21e","url":"https://cdn2.thecatapi.com/images/21e.jpg","width":500,"height":298},{"id":"5op","url":"https://cdn2.thecatapi.com/images/5op.jpg","width":600,"height":900},{"id":"a2b","url":"https://cdn2.thecatapi.com/images/a2b.jpg","width":1280,"height":960},{"id":"b62","url":"https://cdn2.thecatapi.com/images/b62.jpg","width":3264,"height":4928},{"id":"bok","url":"https://cdn2.thecatapi.com/images/bok.jpg","width":520,"height":600},{"id":"csk","url":"https://cdn2.thecatapi.com/images/csk.jpg","width":273,"height":350},{"id":"cu7","url":"https://cdn2.thecatapi.com/images/cu7.jpg","width":640,"height":480},{"id":"efc","url":"https://cdn2.thecatapi.com/images/efc.jpg","width":900,"height":728},{"id":"MTk0NDIyNw","url":"https://cdn2.thecatapi.com/images/MTk0NDIyNw.jpg","width":454,"height":640},{"id":"VwGK1QO3m","url":"https://cdn2.thecatapi.com/images/VwGK1QO3m.jpg","width":1600,"height":1200}]''';

const String catRawJson = '''{
  "id": "21e",
  "url": "https://cdn2.thecatapi.com/images/21e.jpg",
  "width": 500,
  "height": 298
}''';

final Map<String, dynamic> catRawMap = {
  "id": "21e",
  "url": "https://cdn2.thecatapi.com/images/21e.jpg",
  "width": 500,
  "height": 298
};

final CatRaw catRawTest =
    CatRaw("21e", "https://cdn2.thecatapi.com/images/21e.jpg", 500, 298);
