# Copyright (c) 2018 Jan "JayVii" <jayvii@posteo.de>
#     SPDX-License-Identifier: GPL-3.0

# Loading packages {{{ ----

#install.packages("wordcloud",)
library("wordcloud")

# }}}

# Loading data {{{ ----

tweets <- read.csv(file = "~/Develop/TwArchiveR/archives/JayVii_de_2018-06-03_12-56.csv",
		   header = TRUE)

# }}}

# Preparing Data {{{ ----

# only non-retweets
nort <- (!tweets$is_retweet)
text <- as.character(tweets$text_plain[nort])

# filter out certain strings
filter <- paste0("@\\w*\\d*_*\\w*\\d*\\s", # mentions (@somebody)
		 "|[$&+,:;=?@#|'<>.^*()%!_/-]") # special characters
text_clean <- gsub(x = text, pattern = filter, replace = "")

# split up words and calculate frequencies
txt <- unlist(strsplit(x = text_clean, split = " "))
txt_tab <- table(txt)

# }}}

# save picture {{{ ----

png(file = "../thumbs/wordcloud_tweets.png", height = 500, width = 500)
wordcloud(words = names(txt_tab), freq = as.numeric(txt_tab),
	  col = rainbow(length(txt_tab)), ordered.colors = TRUE)
dev.off()

# }}}

# EOF
