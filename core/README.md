<h1 align="center">CatOnly Core</h1>

## Recursos

<h2>Esse pacote tem por finalidade entregar:</h2>

<p>
- superclasse de falha (Failure)
- handler para erros http
- rotas
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

<p>Quando fizer alguma requisição http, use-o para personalizar os erros de forma padronizada</p>

```dart
handleHttpErrorCode(response: response).fold((failure) {
  //throw some exception
}, (noFailure) {
  //work with your response.body with 200 http code
});
```