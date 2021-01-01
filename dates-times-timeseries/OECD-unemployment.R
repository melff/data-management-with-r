unemployment <- read.csv("unemployment.csv")

unemployment.ts <- ts(unemployment[2:5],
                      start = 1970)

plot(unemployment.ts)

window(unemployment.ts,
       start=1980,
       end=1989)

delta.unemployment.ts <- diff(unemployment.ts)
plot(delta.unemployment.ts)
