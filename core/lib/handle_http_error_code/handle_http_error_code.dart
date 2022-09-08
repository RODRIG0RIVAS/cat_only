import 'dart:convert';

import 'package:dependency/dependency.dart';

import '../failure/failure.dart';

abstract class HandleHttpErrorCode {
  Either<Failure, Unit> call({required Response response});
}

class HandleHttpErrorCodeImpl implements HandleHttpErrorCode {
  @override
  Either<Failure, Unit> call({required Response response}) {
    final statusCode = response.statusCode.toString();
    String error = '';

    if (response.statusCode != 200) {
      error = (jsonDecode(response.body)['error']).toString();
    }

    switch (int.parse(statusCode)) {
      case 400:
        return Left(
          Failure(
            error,
            'A solicitação ao servidor está errada',
            statusCode,
          ),
        );
      case 401:
        return Left(
          Failure(
            error,
            'A solicitação foi negada pela falta de autorização',
            statusCode,
          ),
        );
      case 403:
        return Left(
          Failure(
            error,
            'A solicitação foi bloqueada',
            statusCode,
          ),
        );
      case 404:
        return Left(
          Failure(
            error,
            'O resultado para esta solicitação não foi encontrado',
            statusCode,
          ),
        );
      case 500:
        return Left(
          Failure(
            error,
            'A solicitação não pôde ser processada',
            statusCode,
          ),
        );
      case 502:
        return Left(
          Failure(
            error,
            'A solicitação não pôde ser processada por conta da indisponibilidade do servidor',
            statusCode,
          ),
        );
      case 503:
        return Left(
          Failure(
            error,
            'Este serviço está indisponível',
            statusCode,
          ),
        );
      case 504:
        return Left(
          Failure(
            error,
            'O tempo máximo para a solicitação foi alcançado',
            statusCode,
          ),
        );
      default:
        return const Right(unit);
    }
  }
}
