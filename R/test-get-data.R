# Script for testing the statswales_get_dataset() function

library(statswalesr)

df <- statswales_get_dataset("WIMD1909")

metrics <- tryCatch(
    {
        data.frame(
        dataset = "WIMD1909",
        rows = nrow(df),
        cols = ncol(df)
            )
    },
    error = function(cnd) {
        data.frame(
            dataset = "WIMD1909",
            rows = "NULL",
            cols = "NULL"
        )
    }
)

write.csv(metrics, file = paste0("results/metrics-", make.names(Sys.time()), ".csv"))
