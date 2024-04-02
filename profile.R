Rprof()

system.time({
library(dplyr)
library(lubridate)
library(readxl)
po_line <- read_xlsx("po_line.xlsx")
on_hand <- read_xlsx("on_hand.xlsx")

on_hand$week <- as.numeric(substr(on_hand$dt, 5, 6))
po_line$crtd_dt <- as.Date(po_line$crtd_dt, "%Y-%m-%d")
po_line$recpt_dt <- as.Date(po_line$recpt_dt, "%Y-%m-%d")
po_line$week_due <- as.numeric(strftime(po_line$due_dt, format = '%V'))
po_line$week_promised_receipt <- as.numeric(strftime(po_line$ab_dt, format = '%V'))
po_line$week_received <- as.numeric(strftime(po_line$recpt_dt, format = '%V'))
po_line$week_created <- as.numeric(strftime(po_line$crtd_dt, format = '%V'))
po_line$lead_time <- po_line$recpt_dt - po_line$crtd_dt

})
Rprof(NULL)
summaryRprof()
