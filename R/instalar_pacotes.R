# Executar uma vez, se algum pacote ainda não estiver instalado.
pacotes <- c("openxlsx", "dplyr", "tidyr", "ggplot2", "gt", "gtsummary",
             "qqplotr", "DescTools", "htmltools", "jsonlite", "knitr", "rmarkdown")
faltam <- setdiff(pacotes, rownames(installed.packages()))
if (length(faltam)) install.packages(faltam, repos = "https://cloud.r-project.org")
