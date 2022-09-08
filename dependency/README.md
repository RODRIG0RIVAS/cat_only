<h1 align="center">CatOnly Dependencies</h1>

## Recursos

<h2>Esse pacote tem por finalidade entregar:</h2>

<p>
- os packages utilizados no projeto inteiro
</p>

<p id="#packages">
    <h2>Packages</h2>
    <a href="https://pub.dev/packages/flutter_staggered_grid_view" target="_blank">flutter_staggered_grid_view</a><br/>
    <a href="https://pub.dev/packages/flutter_mobx" target="_blank">fpdart</a><br/>
    <a href="https://pub.dev/packages/fpdart" target="_blank">http</a><br/>
    <a href="https://pub.dev/packages/lottie" target="_blank">lottie</a><br/>
    <a href="https://pub.dev/packages/transparent_image" target="_blank">transparent_image</a><br/>
</p>

## Primeiros passos

<p>Quando for adicionar este package ao cat_only, certifique-se se o que deseja exportar está no arquivo dependency.dart.

Então, adicione no pubspec.yaml do cat_only a seguinte declaração:</p>

```yaml
dependencies:
  dependency:
    path: ../dependency
```

## Uso

<p>Quando for utilizar algo vindo de um package externo, adicione neste package para gerenciar as dependências dos packages. Assim, os problemas de versionamento de packages serão extremamente diminuídos.</p>

<p>Não esqueça de exportar o package adicionado</p>

```dart
export 'some_package';
```

<p>Ao utilizar, não esqueça de importar este package da determinada forma.</p>

```dart
import 'package:dependency/dependency.dart';
```

# Informações adicionais

<p>Pacotes de testes foram adicionados de uma forma diferente. Eles estão no dev_dependencies de cada projeto que os contemple.</p>

<p>Não pode ser esquecido de cumprir com o seguimento de dependências de package por meio deste "controlador".</p>