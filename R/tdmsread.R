# Data Stream (.tdms Format) Reading Function - 2nd Dec 2021 - Version 1
library(tdmsreader)
f = file('tests/MC_Off_1_Acc.tdms', 'rb')
main = TdmsFile$new(f)
main$read_data(f, 0, 1)
r = main$objects[[ "/'Untitled'/'Dev1/ai0'"]]
t = r$time_track(start = 0, end = 1)
s = r$data
png('out.png')
plot(t, s, xlab = 'Time', ylab = 'Volts')
title('TDMS reader')
dev.off()
close(f)
