<h1 align="center">CatOnly Core</h1>

## Esse pacote tem por finalidade entregar:

<p>
  <ul>
    <li>superclasse de falha (Failure)</li>
    <li>handler para erros http</li>
    <li>rotas</li>
  </ul>
</p>

## Primeiros passos

<p>Quando for adicionar este package ao cat_only, certifique-se se o que deseja exportar está no arquivo core.dart.

Então, adicione no pubspec.yaml do cat_only a seguinte declaração:</p>

```yaml
dependencies:
  core:
    path: ../core
```

## Uso

### Failure

<p>Superclasse de falha. Será usada quando alguma exceção personalizada for criada.</p>

```dart
class CustomException extends Failure{
  CustomException(super.serverMessage, super.userMessage, super.code);
}
```

### HandleHttpErrorCode

<p>Quando fizer alguma requisição http, use-o para personalizar os erros de forma padronizada.</p>

```dart
handleHttpErrorCode(response: response).fold((failure) {
  //throw some exception
}, (success) {
  //work with your response.body with 200 http code
});
```

### Routes

<p>Basta chamar de forma estática.</p>

```dart
RouteNames.someRoute;
```