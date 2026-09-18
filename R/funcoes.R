library(openxlsx)
library(dplyr)
library(ggplot2)
library(gt)
library(gtsummary)
theme_gtsummary_language("pt", big.mark = ".", decimal.mark = ",")
# A planilha é uma transcrição, não uma base de desfechos individuais.
individuos <- read.xlsx("dados/dados_artigo.xlsx", sheet = "individuos") |>
  mutate(grupo = factor(grupo, levels = c("AIG", "PIG")),
         ig = ig_semanas + ig_dias / 7,
         igc = igc_semanas + igc_dias / 7)
metodos <- read.xlsx("dados/dados_artigo.xlsx", sheet = "metodos")
subgrupos <- read.xlsx("dados/dados_artigo.xlsx", sheet = "subgrupos")
sinais <- read.xlsx("dados/dados_artigo.xlsx", sheet = "sinais") |>
  mutate(momento = factor(momento, levels = c("Antes", "Durante", "Depois")))
cores <- c("TSD" = "#007f7a", "Seringa" = "#c65b38")
numero <- function(x, casas = 1) formatC(x, format = "f", digits = casas, decimal.mark = ",")
tema <- function() theme_minimal(base_size = 17, base_family = "sans") +
  theme(panel.grid.minor = element_blank(), panel.grid.major.x = element_blank(),
        legend.position = "top", legend.title = element_blank(),
        plot.title = element_text(face = "bold", color = "#153246"),
        plot.background = element_rect(fill = "#fbfaf6", color = NA))
tabela_resultados <- function() {
  metodos |>
    transmute(Indicador = paste0(variavel, " (", unidade, ")"),
              TSD = paste0(numero(tsd_media,2), " (", numero(tsd_dp,2), ")"),
              Seringa = paste0(numero(seringa_media,2), " (", numero(seringa_dp,2), ")"),
              `Valor-p` = p_texto) |>
    gt() |>
    cols_align(align = "center", columns = c(TSD, Seringa, `Valor-p`)) |>
    cols_width(Indicador ~ pct(40), TSD ~ pct(22), Seringa ~ pct(22), `Valor-p` ~ pct(16)) |>
    tab_spanner(label = "Média (desvio padrão)", columns = c(TSD, Seringa)) |>
    tab_style(style = cell_text(weight = "bold", color = "#007f7a"),
              locations = cells_body(rows = c(1,3), columns = everything())) |>
    tab_options(table.font.size = px(23), data_row.padding = px(12),
                table.width = pct(100), table.background.color = "#fbfaf6")
}
tabela_subgrupos <- function() {
  subgrupos |>
    left_join(select(metodos, id, variavel, unidade), by = "id") |>
    mutate(Indicador = paste0(variavel, " (", unidade, ")"),
           Comparacao = paste0(numero(aig_media,2), " / ", numero(pig_media,2)),
           p = numero(p,3)) |>
    select(Indicador, metodo, Comparacao, p) |>
    tidyr::pivot_wider(names_from = metodo, values_from = c(Comparacao,p)) |>
    gt() |>
    cols_align(align = "center", columns = -Indicador) |>
    cols_width(Indicador ~ pct(36), Comparacao_TSD ~ pct(20), p_TSD ~ pct(12),
               Comparacao_Seringa ~ pct(20), p_Seringa ~ pct(12)) |>
    cols_label(Comparacao_TSD = "AIG / PIG", p_TSD = "Valor-p",
               Comparacao_Seringa = "AIG / PIG", p_Seringa = "Valor-p") |>
    cols_move(columns = p_TSD, after = Comparacao_TSD) |>
    tab_spanner(label = "TSD", columns = c(Comparacao_TSD,p_TSD)) |>
    tab_spanner(label = "Seringa", columns = c(Comparacao_Seringa,p_Seringa)) |>
    tab_style(style = cell_text(weight = "bold", color = "#007f7a"),
              locations = cells_body(rows = 1, columns = c(Comparacao_TSD,p_TSD))) |>
    tab_options(table.font.size = px(21), data_row.padding = px(10),
                table.width = pct(100), table.background.color = "#fbfaf6")
}
grafico_sinais <- function() {
  sinais |>
    mutate(faceta = paste0(variavel, " (", unidade, ")")) |>
    ggplot(aes(momento, media, color = metodo, group = metodo, shape = metodo)) +
    geom_line(linewidth = 1.1) + geom_point(size = 3.2) +
    facet_wrap(~faceta, scales = "free_y") +
    scale_color_manual(values = cores) + labs(x = NULL, y = "Média publicada") + tema()
}
painel_comparacao <- function(exibir_nota = TRUE) {
  dados <- jsonlite::toJSON(metodos, dataframe = "rows", auto_unbox = TRUE)
  htmltools::HTML(paste0('<div class="comparison-widget"><script type="application/json">',dados,
    '</script><label class="control-label">Indicador <select class="metric-select" aria-label="Indicador de alimentação"></select></label>',
    '<div class="metric-chart" role="img"></div><div class="metric-detail" aria-live="polite"></div>',
    if (exibir_nota) '<p class="widget-note">Médias publicadas. Diferença = seringa − TSD. Valor-p do teste t pareado, conforme Tabela 3. Sem recálculo do teste.</p>' else '', '</div>'))
}
painel_sinais <- function() {
  dados <- jsonlite::toJSON(sinais, dataframe = "rows", auto_unbox = TRUE)
  htmltools::HTML(paste0('<div class="vitals-widget"><script type="application/json">',dados,
    '</script><label class="control-label">Parâmetro <select class="vital-select" aria-label="Parâmetro fisiológico"><option>Saturação de oxigênio</option><option>Frequência cardíaca</option></select></label>',
    '<div class="vital-chart" role="img"></div><div class="vital-detail" aria-live="polite"></div>',
    '<p class="widget-note">Médias das Figuras 4 e 5, p. 216. O eixo vertical é ampliado para mostrar a variação. Não representa trajetórias individuais.</p></div>'))
}
