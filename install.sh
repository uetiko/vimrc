#!/usr/bin/env bash
# Instala esta configuracion de Vim. Es idempotente: se puede ejecutar
# varias veces sin romper nada.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIM_DIR="${HOME}/.vim"
PLUG_VIM="${VIM_DIR}/autoload/plug.vim"
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

make_dirs() {
    mkdir -p "${VIM_DIR}/config"
    mkdir -p "${VIM_DIR}/backup"
    mkdir -p "${VIM_DIR}/tmp"
    mkdir -p "${VIM_DIR}/undo"
    mkdir -p "${VIM_DIR}/tags"
    mkdir -p "${VIM_DIR}/autoload"
}

# ln -sfn evita el error "ya existe" al reinstalar.
link() {
    local src="$1" dest="$2"
    ln -sfn "${src}" "${dest}"
    echo "  ${dest} -> ${src}"
}

make_symbolic_links() {
    echo "Creando enlaces simbolicos:"
    link "${REPO_DIR}/config.vim"        "${VIM_DIR}/config/config.vim"
    link "${REPO_DIR}/plugins.vim"       "${VIM_DIR}/config/plugins.vim"
    link "${REPO_DIR}/pluginsConfig.vim" "${VIM_DIR}/config/pluginsConfig.vim"
    link "${REPO_DIR}/.vimrc"            "${HOME}/.vimrc"
}

install_plug() {
    if [ ! -f "${PLUG_VIM}" ]; then
        echo "Instalando vim-plug..."
        curl -fsSLo "${PLUG_VIM}" --create-dirs "${PLUG_URL}"
    else
        echo "vim-plug ya esta instalado."
    fi
}

install_plugins() {
    echo "Instalando plugins (:PlugInstall)..."
    vim -E -s -u "${HOME}/.vimrc" +PlugInstall +qall </dev/null || true
    echo "Hecho."
}

# Avisa de las herramientas externas que la configuracion sabe usar.
check_optional_tools() {
    echo
    echo "Herramientas externas opcionales:"
    for tool in git ctags fzf rg flake8 black isort eslint prettier tsc clang-format; do
        if command -v "${tool}" >/dev/null 2>&1; then
            printf '  [ok]      %s\n' "${tool}"
        else
            printf '  [ausente] %s\n' "${tool}"
        fi
    done
    echo
    echo "Las que falten simplemente quedan desactivadas; Vim no dara errores."
}

main() {
    make_dirs
    make_symbolic_links
    install_plug
    install_plugins
    check_optional_tools
}

main "$@"
