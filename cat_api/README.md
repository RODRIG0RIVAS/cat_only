<h1 align="center">CatOnly API</h1>

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

## Recursos

<h2>Esse pacote tem por finalidade entregar:</h2>

<p>
- Lista de gatos
</p>

<h2>O que cada camada contém, neste projeto</h2>
<p>
domain - endpoints, entidades, exceções, interface do repositório e casos de uso

external - implementação do datasource

infra - adaptadores, interface do datasource e implementação do repositório
</p>

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