# Release checklist para a versão 1.0.0

Este documento descreve os critérios de prontidão para um lançamento estável `1.0.0`.

## Critérios principais

- [ ] O versionamento segue [SemVer](https://semver.org/) com `MAJOR.MINOR.PATCH`.
- [ ] As mudanças são documentadas no changelog ou na página de release.
- [ ] O código foi revisado e validado em pelo menos uma revisão de PR.
- [ ] O build do gem funciona com `gem build rawfeed.gemspec`.
- [ ] A biblioteca carrega corretamente com `require "rawfeed"`.
- [ ] O projeto possui templates de issue e pull request.
- [ ] O README e `CONTRIBUTING.md` estão atualizados.
- [ ] O projeto possui um workflow de CI para verificar builds e dependências.
- [ ] A licença está clara e visível.

## Itens de qualidade

- [ ] Há documentação suficiente para colaboradores e mantenedores.
- [ ] O projeto tem um processo de release definido.
- [ ] Os recursos principais funcionam e não introduzem regressões.
- [ ] As dependências são compatíveis com Ruby 3.x.

## Passos para o lançamento 1.0.0

1. Atualizar `lib/rawfeed/core/version.rb` para `1.0.0`.
2. Atualizar a URL do changelog ou notas de release se necessário.
3. Atualizar o `README.md` e `CONTRIBUTING.md` com o novo status de release.
4. Executar `gem build rawfeed.gemspec` e validar o artefato gerado.
5. Criar um release no GitHub com as notas resumindo o que mudou.
6. Publicar no RubyGems:

   ```bash
   gem push rawfeed-1.0.0.gem
   ```

7. Marcar a milestone ou tag de versão no repositório.

## Observações

A versão `1.0.0` deve ser usada quando o projeto estiver estável e pronto para uso em produção, com documentação e processo de contribuições claros.
