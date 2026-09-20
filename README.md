# vimrc

Configuración personal de Vim: editor base, gestor de plugins (`vim-plug`) e
integración con herramientas externas (linters, formateadores, ctags, fzf...).
Instalación reproducible mediante symlinks e idempotente — se puede volver a
ejecutar sin romper nada.

## Requisitos

- Vim (con soporte de `clientserver`/`+python3` recomendado según los plugins que uses).
- `git` y `curl`.
- Opcionales, detectados automáticamente por `install.sh` y desactivados en
  silencio si faltan: `ctags`, `fzf`, `rg`, `flake8`, `black`, `isort`,
  `eslint`, `prettier`, `tsc`, `clang-format`.

## Instalación

```sh
git clone git@github.com:uetiko/vimrc.git
cd vimrc
./install.sh
```

`install.sh`:

1. Crea `~/.vim/{config,backup,tmp,undo,tags,autoload}`.
2. Enlaza (`ln -sfn`) los archivos del repo dentro de `~/.vim/config/` y
   `~/.vimrc` en el `$HOME`.
3. Instala `vim-plug` si no está presente.
4. Ejecuta `:PlugInstall` para bajar todos los plugins.
5. Muestra qué herramientas externas opcionales están disponibles en el sistema.

## Estructura

| Archivo               | Contenido                                                      |
|------------------------|-----------------------------------------------------------------|
| `.vimrc`               | Punto de entrada; carga los tres archivos de `~/.vim/config/`.  |
| `config.vim`           | Ajustes generales del editor (sin dependencia de plugins).      |
| `plugins.vim`          | Declaración de plugins vía `vim-plug`.                          |
| `pluginsConfig.vim`    | Configuración de cada plugin, protegida por `s:HasPlug()` para no romper el arranque si un plugin falta. |
| `install.sh`           | Instalador idempotente descrito arriba.                         |

## Plugins

- **Explorador de archivos:** `nerdtree`, `nerdtree-git-plugin`
- **Interfaz:** `vim-airline`, `vim-airline-themes`, `indentLine`, `vim-numbertoggle`
- **Git:** `vim-fugitive`, `vim-gitgutter`
- **Búsqueda:** `fzf`, `fzf.vim`
- **Linting/diagnóstico:** `ale`
- **Tags:** `tagbar`, `vim-gutentags`
- **Snippets:** `ultisnips`, `vim-snippets`
- **Lenguajes:** `vim-javascript`, `typescript-vim`, `rust.vim`, `phpcomplete.vim`, `vim-clang-format`
- **Sesiones:** `vimsessionist`
- **Otros:** `vim-wakatime`

Gestión: `:PlugInstall`, `:PlugUpdate`, `:PlugClean`.

## Atajos principales

| Tecla                  | Acción                                  |
|--------------------------|------------------------------------------|
| `Ctrl-n` / `F2`         | Alternar NERDTree                        |
| `<leader>n`             | Localizar archivo actual en NERDTree     |
| `Ctrl-p`                | Buscar archivos (fzf)                    |
| `<leader>b`             | Buscar buffers                           |
| `<leader>f`             | Buscar con ripgrep (`:Rg`)               |
| `<leader>t`             | Buscar tags                              |
| `F8`                    | Alternar Tagbar                          |
| `F3`                    | `:ALEFix` (formatear/arreglar)           |
| `[g` / `]g`             | Ir al diagnóstico anterior/siguiente (ALE) |
| `<leader>d` / `<leader>r` | Ir a definición / buscar referencias (ALE) |
| `Ctrl-j` / `Ctrl-k`     | Expandir/saltar snippet (UltiSnips)      |
| `<leader><space>`       | Quitar resaltado de búsqueda             |
| `Ctrl-h/j/k/l`          | Navegar entre ventanas                   |

## Licencia

[LGPL-3.0](LICENSE)
