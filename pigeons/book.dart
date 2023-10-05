import 'package:pigeon/pigeon.dart';

class Book{
  String? title;
  String? urlImage;
}

@HostApi()
abstract class BookApi{
  List<Book?> search(String keyword);
}