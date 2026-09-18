# Proveniência

Fonte única: Araújo VC, Maciel ACM, Paiva MAR, Bezerra ACB. CoDAS. 2016;28(3):212–220. DOI: 10.1590/2317-1782/20162015152. PDF “Artigo2 (1).pdf” fornecido pelo usuário.

- `tabela1_individuos.csv`: transcrição literal das 30 linhas da Tabela 1, p. 215. ID é a identificação publicada. Idades separadas em semanas inteiras e dias adicionais. Pesos em gramas, períodos em dias. AIG/PIG seguem a classificação original. Não há sexo individual nessa tabela, portanto essa coluna não foi criada. Os totais 13/17 vêm do texto do artigo.
- `tabela3_metodos.csv`: médias, margens de IC e desvios padrão da Tabela 3, p. 217. Todos os métodos usam os mesmos 30 participantes. `p_texto` é o resultado original. `p_limite` é um campo numérico de referência, com 0,001 representando o limite da desigualdade no derramamento, nunca um p exato.
- `tabela2_subgrupos.csv`: Tabela 2, p. 217. AIG n=18 e PIG n=12, em cada método. Teste informado: ANOVA. `id` liga o indicador à Tabela 3.
- `figuras4_5_sinais.csv`: médias, margens de IC e DP rotulados nas Figuras 4 e 5, p. 216, conferidos visualmente. Saturação em %, frequência em bpm. Antes, durante (um minuto após o início) e depois.
- `dados_artigo.xlsx`: as mesmas quatro bases, geradas por `R/preparar_dados.R`. CSV é a origem editável; se alterar algum, regenere o Excel.

Os campos `ic_margem` guardam o número após “±”, que o artigo denomina intervalo de confiança. Não representam limites completos nem IC da diferença pareada. Não assumimos independência para derivar erros da diferença. O dashboard não mostra intervalos.

As estatísticas calculadas da Tabela 1 são resumos das linhas publicadas. Divergências com resumos arredondados do artigo não devem ser corrigidas alterando observações. Nenhum dado de desfecho individual foi reconstruído ou simulado.
