<h1 align="center">CatOnly Design System</h1>

<p align="left">
  <ul>
    <li>M</li>
    <li>i</li>
    <li>a</li>
    <li>d - design</li>
    <li>o</li>
    <li>s - system</li>
  </ul>
</p>

<p>Esse nome foi escolhido porque ver tantos gatos me lembram os miados.</p>

## Esse pacote tem por finalidade entregar:

<p>
  <ul>
    <li>cores</li>
    <li>fontes</li>
    <li>controladores do SystemUiOverlay e do Theme</li>
    <li>Theme</li>
    <li>âncoragem de widgets vindos de outros packages</li>
  </ul>
</p>

## Primeiros passos

<p>Quando for adicionar este package ao cat_only, certifique-se se o que deseja exportar está no arquivo miados.dart.

Então, adicione no pubspec.yaml do cat_only a seguinte declaração:</p>

```yaml
dependencies:
  miados:
    path: ../miados
```

## Uso

<p>O que for adicionado no construtor do Theme, será recuperado por meio do Theme.</p>

```dart
final standardBackgroundColor = Theme.of(context).backgroundColor;
```

<p>Será adicionado desta forma na aplicação. Até então não há darkTheme, será adicionado posteriormente.</p>

```dart
    return MaterialApp(
      theme: useThemeController().currentThemeData(context, kleeOne),
    );
```