# Script for testing the statswales_get_dataset() function

library(statswalesr)

df <- statswales_get_dataset("WIMD1909")

# Latest results
new_metrics <- tryCatch(
    {
        data.frame(
        dataset = "WIMD1909",
        rows = nrow(df),
        cols = ncol(df),
        date_time = make.names(Sys.time())
            )
    },
    error = function(cnd) {
        data.frame(
            dataset = "WIMD1909",
            rows = "NULL",
            cols = "NULL",
            date_time = make.names(Sys.time())
        )
    }
)

# Read in previous results if present
if("metrics-results.csv" %in% list.files("results")) {

    old_metrics <- read.csv("results/metrics-results.csv")
    
    print(old_metrics)

    updated_metrics <- rbind(old_metrics, new_metrics)

} else {

    updated_metrics <- new_metrics

}


# Write out to new csv
write.csv(updated_metrics, file = "results/metrics-results.csv", row.names = F)
