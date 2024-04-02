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
po_line$week_due <- week(po_line$due_dt)
po_line$week_promised_receipt <- week(po_line$ab_dt)
po_line$week_received <- week(po_line$recpt_dt)
po_line$week_created <- week(po_line$crtd_dt)
po_line$lead_time <- po_line$recpt_dt - po_line$crtd_dt

})
Rprof(NULL)
summaryRprof()
