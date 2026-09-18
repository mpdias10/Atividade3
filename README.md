# Atividade3

Apresentação Quarto da Atividade Avaliativa 4, seção 8.5 de Prática Estatística II. Leitura estatística de Araújo et al. (2016), DOI 10.1590/2317-1782/20162015152. Conteúdo em português, quatro capítulos e roteiro para aproximadamente 11–12 minutos.

## Abrir agora

- `docs/index.html`: slides prontos. Abra no navegador.
- `docs/painel.html`: dashboard interativo.
- `docs/apoio.html`: caderno de apoio com tabelas e códigos.

Os três HTML têm recursos incorporados para uso local. Mantenha-os na mesma pasta para os links entre eles funcionarem. A internet é necessária apenas para acessar links externos, como o DOI. As interações não precisam de servidor R.

## Editar no RStudio

1. Extraia o ZIP inteiro para uma pasta local.
2. Abra `Atividade3.Rproj`.
3. Em `index.qmd`, substitua o campo `author` pelos nomes e e-mails. Confira a instituição e a data automática.
4. Se faltar algum pacote, execute `source("R/instalar_pacotes.R")` no Console.
5. A planilha já está pronta. Se editar os CSV, execute `source("R/preparar_dados.R")` para atualizá-la.
6. Clique em Render com `index.qmd` aberto para gerar os slides. Para atualizar os três documentos, execute `quarto render` no Terminal.

O botão Render executa os chunks R. Os exemplos que dependem de dados individuais ausentes estão com `eval: false` e ficam no caderno de apoio. O projeto não inventa dados para forçar a aplicação de funções.

## Arquivos

- `index.qmd`: slides e notas do apresentador.
- `painel.qmd`: dashboard Quarto.
- `apoio.qmd`: detalhes, diagnósticos didáticos e códigos.
- `assets/custom.css`: aparência.
- `assets/interacoes.html`: controles locais dos painéis.
- `R/funcoes.R`: leitura, tabelas e gráficos em R.
- `dados/`: CSV transcritos e planilha Excel de quatro abas.
- `dados/LEIA-ME.md`: origem, unidades e limites dos dados.
- `ROTEIRO.md`: tempo sugerido e fala de cada slide.

## Publicação no GitHub Pages

Este projeto foi preparado localmente; ainda não foi publicado.

1. Crie ou use o repositório `Atividade3` na sua conta.
2. Envie o projeto completo, incluindo fontes, dados e a pasta `docs` (não apenas `index.html`). Não envie senhas ou tokens.
3. Na configuração de Pages do repositório, escolha publicação pela branch `main`, pasta `/docs`.
4. Depois que a publicação terminar, confira os slides e os links para painel e apoio no endereço que o GitHub mostrar.
5. Cole esse endereço na “Atividade Avaliativa 4” do Google Classroom.

O arquivo `docs/.nojekyll` já está incluído. O nome de usuário e o endereço público dependem da sua conta. Se estiver usando Git pelo Terminal, revise `git status`, adicione os arquivos do projeto, faça um commit e envie para o remoto configurado. A criação e o envio ao repositório não foram executados automaticamente.

## Apresentar

Use setas para navegar, Esc para visão geral e S para notas. No slide de ANOVA, explique as duas comparações lado a lado. No painel dos slides, escolha dois ou três indicadores, sem explorar todos durante a fala. O dashboard completo e o caderno são apoio para perguntas e ficam fora do roteiro principal.

## Leitura crítica

Os resultados são os publicados no artigo. A Tabela 1 contém características individuais, mas faltam os desfechos individuais por método. Não se recalculam t pareado ou ANOVA temporal com médias e desvios padrão marginais. A apresentação aponta a ordem fixa, a avaliação em um dia, a descrição incompleta das suposições e a falta de detalhamento do modelo temporal. Pearson aparece no artigo, mas não é aprofundado porque não consta da revisão fornecida como foco.
