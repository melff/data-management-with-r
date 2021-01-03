library(quanteda)
## Obtaining tokens in text documents using 'quanteda' ###################################

quanteda_options(print_tokens_max_ndoc=3,
                 print_tokens_max_ntoken=6)

inaugural_toks <- tokens(data_corpus_inaugural)
inaugural_toks

inaugural_ntoks <- sapply(inaugural_toks,
                          length)
inaugural_ntoks <- cbind(docvars(inaugural_toks),
                         ntokens = inaugural_ntoks)

with(inaugural_ntoks,
     scatter.smooth(Year,ntokens,
                    ylab="Number of tokens per speech"))


inaugural_sntc_toks <- tokens(inaugural_sntc)
inaugural_sntc_ntoks <- sapply(inaugural_sntc_toks,
                               length)
inaugural_sntc_ntoks <- cbind(docvars(inaugural_sntc_toks),
                              ntokens = inaugural_sntc_ntoks)
inaugural_sntc_ntoks <- aggregate (ntokens~Year,mean,
                                data = inaugural_sntc_ntoks)
with(inaugural_sntc_ntoks,
     scatter.smooth(Year,ntokens,
                    ylab="Number of tokens per sentence"))
