#! /bin/bash

import view.CLI='source ./CLI.sh';
import view.GUI='source ./GUI.sh';

# "Classe" que inicia a execução propriamente dita do AVD Launcher.
#
# Author: Gustavo Moraes <gustavosotnas1@gmail.com>
#
# This file is subject to the terms and conditions of the GNU General Public
# License. See the file COPYING in the main directory of this archive
# for more details.


# Função que chama funções de possíveis caminhos de execução do App (GUI ou CLI)
# Parâmetros:
# 	$@ - args de linha de comando (--version, --help, -h)
main()
{
	case "$@" in
		"-h"|"--help" )
			view.CLI displayHelp;; # Exibe texto de ajuda no Terminal (CLI)
		"--version" )
			view.CLI displayVersion;; # Exibe a versão do programa
		"") # Sem args do usuário
			view.GUI start;; # Executa as funcionalidades do programa em GUI
		*) # "default"
			view.CLI displayInvalidArgs "$@";; # Exibe "opção inválida" com args
	esac
}

main $@; #chama função principal