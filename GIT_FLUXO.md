# Git fluxo diario (repo HOME)

Este repositorio fica no seu HOME. Entao use adicionamento manual de arquivos.

## Comandos uteis

- git st
  - mostra status curto
- git lg
  - mostra historico resumido
- git safeadd <arquivo...>
  - adiciona somente arquivos informados

## Fluxo recomendado

1. Ver status

   git st

2. Adicionar somente o que quer versionar

   git safeadd caminho/do/arquivo

3. Criar commit

   git commit -m "mensagem clara"

4. Ver historico

   git lg

## Boas praticas para repo no HOME

- Evite usar git add .
- Revise antes de commitar:

  git diff --staged

- Se adicionou algo por engano:

  git restore --staged caminho/do/arquivo

## Publicar no remoto (quando tiver URL)

1. Adicionar remoto:

   git remote add origin <URL_DO_REPOSITORIO>

2. Enviar branch main:

   git push -u origin main
