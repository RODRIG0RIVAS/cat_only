<h1 align="center">CatOnly API</h1>

<div align="center">
    <img src="https://img.shields.io/badge/coverage-100%25-brightgreen"/>
</div>

<p>Este pacote consumirá a The cat API</p>

<p>
Você pode acessá-la em:
    <p>
        <a href="https://thecatapi.com/" target="_blank">
        The CatAPI
        </a>
        .
    </p>
</p>

## Esse pacote tem por finalidade entregar:

<p>
- Lista de gatos
</p>

<h2>Clean Dart</h2>

<p>Procurei seguir a proposta do <a href="https://github.com/Flutterando/Clean-Dart">Clean Dart</a> para a criação deste módulo</p>

## Primeiros passos

<p>Quando for adicionar este package ao cat_only, certifique-se se o que deseja exportar está no arquivo cat_api.dart.

Então, adicione no pubspec.yaml do cat_only a seguinte declaração:</p>

```yaml
dependencies:
  cat_api:
    path: ../cat_api
```

## Uso

<p>Os usecases são responsáveis por levarem as informações para os controladores/stores. Deverão ser chamados por meio da interface. Por exemplo:</p>

```dart
class Controller{
  final GetCatPageLimit _getCatPageLimit;

  Controller(this._getCatPageLimit);
}
```

<p>Então, será necessário injetar a implementação di GetCatPageLimit quando instanciar o Controller.</p>


<p><b>Vale lembrar que é apenas um exemplo, use concordante você queira. Seja por meio de algum package que ajude na injeção de dependência ou por algum meio próprio. O importante é manter a DI.</b></p>

# Informações adicionais

<p>Não esqueça de executar o build_runner, pois ele é necessário para os testes.</p>