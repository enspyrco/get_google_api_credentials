import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

Future<AccessCredentials> obtainCredentials() async {
  final client = http.Client();

  try {
    return await obtainAccessCredentialsViaUserConsent(
      ClientId(
          '384716656676-lkhc8q5n87b2jg023ma4mfi5496tgns5.apps.googleusercontent.com',
          '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'),
      ['https://www.googleapis.com/auth/gmail.modify'],
      client,
      _prompt,
    );
  } finally {
    client.close();
  }
}

void _prompt(String url) {
  print('Please go to the following URL and grant access:');
  print('  => $url' r'&access_type=offline');
  print('');
}
