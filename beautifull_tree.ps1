# Captura de argumentos de linha de comando e execução da função
param (
    [string]$Path = (Get-Location),
    [switch]$Folders,
    [bool]$IgnoreCache = $true,
    [string[]]$IgnoreDirectories = @(),
    [switch]$Help
)


function beautifull_tree {
    param (
        [string]$Path = (Get-Location),
        [switch]$Folders,
        [bool]$IgnoreCache = $true,
        [string[]]$IgnoreDirectories = @(),
        [switch]$Help
    )

    if ($Help) {
        Write-Output @"
beautifull_tree [-Path <string>] [-Folders] [-IgnoreCache] [-IgnoreDirectories <string[]>] [-FindDirectory <string>] [-Help]

-Path <string>:
    O caminho do diretório a ser listado. O valor padrão é o diretório atual.

-Folders:
    Lista apenas diretórios. Se este parâmetro for fornecido, os arquivos não serão listados.

-IgnoreCache:
    Ignora diretórios que contenham 'cache' no nome. O valor padrão é true. (Utilize $ antes do true ou false)

-IgnoreDirectories <string[]>:
    Uma lista de nomes de diretórios a serem ignorados. Exemplo: @("node_modules", "dist").

-Help:
    Exibe esta mensagem de ajuda.
"@
        return
    }

    # Função recursiva para construir a estrutura do diretório
    function Get-Tree {
        param (
            [string]$SubPath,
            [int]$Level = 0
        )

        $indent = '    ' * $Level
        Get-ChildItem -Path $SubPath | ForEach-Object {
            # Verificar se o item é um diretório e se deve ser ignorado
            if ($_.PSIsContainer) {
                if ($IgnoreCache -and $_.Name -match 'cache') {
                    return
                }
                if ($IgnoreDirectories -contains $_.Name) {
                    return
                }
                Write-Output "$indent├───$($_.Name)"
                Get-Tree -SubPath $_.FullName -Level ($Level + 1)
            } elseif (-not $Folders) {
                Write-Output "$indent├───$($_.Name)"
            }
        }
    }

    # Mostrar o nome do diretório atual
    $currentDirName = Split-Path -Path $Path -Leaf
    Write-Output "${currentDirName}:"

    # Mostrar a estrutura do diretório
    Get-Tree -SubPath $Path
}

# Executar a função com os parâmetros capturados
beautifull_tree -Path $Path -Folders:$Folders -IgnoreCache:$IgnoreCache -IgnoreDirectories $IgnoreDirectories -FindDirectory $FindDirectory -Help:$Help