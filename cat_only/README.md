<h1 align="center">CatOnly App</h1>

## Recursos

<p>Gerência de estado por meio do ChangeNotifier e ValueNotifier</p>

<p>
O projeto está subdividido em determinados pontos:

- controllers: são os controladores das telas

- injectors: são as dependências necessárias para os controladores

<h2>Pages:</h2>
<pre>
    _root: é a página raiz
    
    first_loading: é onde a primeira lista de gatos é carregada

    home: aqui os gatos são exibidos

    splash: aqui é onde há a primeira interação com o usuário. Onde ele irá para a first_loading
</pre>

<h2>Injectors:</h2>
    Perceba que em algumas pages há uma pasta chamada inject. Ela é para que o controller tenha suas injeções de dependências feitas. Por sua vez, ela retorna esse controller que é usado em sua determinada page.
</p>