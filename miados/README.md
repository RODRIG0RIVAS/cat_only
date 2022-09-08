<h1 align="center">CatOnly Design System</h1>

<p align="left">
M
i
a
d - design
o
s - system
</p>

<p>Esse nome foi escolhido porque ver tantos gatos me lembram os miados.</p>

## Recursos

<h2>Esse pacote tem por finalidade entregar:</h2>

<p>
- cores
- fontes
- controladores do SystemUiOverlay e do Theme
- Theme
- âncoragem de widgets vindos de outros packages
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
final standartBackgroundColor = Theme.of(context).backgroundColor;
```

<p>Será adicionado desta forma na aplicação. Até então não há darkTheme, será adicionado posteriormente.</p>

```dart
    return MaterialApp(
      theme: useThemeController().currentThemeData(context, kleeOne),
    );
```