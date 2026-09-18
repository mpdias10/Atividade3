# Executar a partir da raiz do projeto. Somente dados publicados no artigo.
library(openxlsx)
arquivos <- c(individuos = "tabela1_individuos.csv",
              metodos = "tabela3_metodos.csv",
              subgrupos = "tabela2_subgrupos.csv",
              sinais = "figuras4_5_sinais.csv")
abas <- lapply(arquivos, function(x) read.csv(file.path("dados", x),
                  stringsAsFactors = FALSE, fileEncoding = "UTF-8"))
write.xlsx(abas, "dados/dados_artigo.xlsx", overwrite = TRUE)
