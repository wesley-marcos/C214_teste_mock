import 'package:atividade_6_mock/home.dart';
import 'package:atividade_6_mock/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'fetch_user_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {

  group('fetch_user', () {

    test('retorna um usuário de a conexão funcionar', () async{

      final client = MockClient();

      when(client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users/7')))
          .thenAnswer((_) async =>
          http.Response(
              '{"id": 7, "name" : "Kurtis Weissnat", '
                  '"username" : "Elwyn.Skiles", "email" : "Telly.Hoeger@billy.biz",'
                  '"phone" : "210.067.6132", "website" : "elvis.io"}', 200));

      expect(await fetchUser(client), isA<User>());
    });
  });
}