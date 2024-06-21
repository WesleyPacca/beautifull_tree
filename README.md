```
beautifull_tree [-Path <string>] [-Folders] [-IgnoreCache] [-IgnoreDirectories <string[]>] [-FindDirectory <string>] [-Help]
```

-Path <string>:
    O caminho do diretório a ser listado. O valor padrão é o diretório atual.

-Folders:
    Lista apenas diretórios. Se este parâmetro for fornecido, os arquivos não serão listados.

-IgnoreCache:
    Ignora diretórios que contenham 'cache' no nome. O valor padrão é true.

-IgnoreDirectories <string[]>:
    Uma lista de nomes de diretórios a serem ignorados. Exemplo: @("node_modules", "dist").

-FindDirectory <string>:
    Procura por uma pasta específica dentro da estrutura de diretórios e exibe apenas essa pasta e seu conteúdo.

-Help:
    Exibe esta mensagem de ajuda.

![image](https://github.com/WesleyPacca/beautifull_tree/assets/146728038/dab62c38-25b9-4491-88b5-79575889e66b)
